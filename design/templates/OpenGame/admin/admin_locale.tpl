<script type="text/javascript">
var lang_list = Array();

function addRow()
{
  var stringName = prompt("{L_adm_lng_string_name}", "");
  if(!stringName)
  {
    return;
  }

  if(stringName[0] != '[')
  {
    stringName = '[' + stringName + ']';
  }

  var table = document.getElementById('localeStrings');

  var rowCount = table.rows.length;
  var row = table.insertRow(rowCount-1);

  var cell = row.insertCell(0);
  cell.innerHTML = 'X';
  cell.style.class="c_c";
  cell.onclick="this.parentElement.parentElement.removeChild(this.parentElement);";

  cell = row.insertCell(1);
  cell.innerHTML = stringName;
  cell.style.class="c_l";
  cell.style.textAlign = "left";

  cellId = 2;
  for(lang_id in lang_list)
  {
    var element = document.createElement("input");
    element.type = "text";
    element.size = "30";
    element.name = "lang_new" + stringName + '[' + lang_id + ']';

    cell = row.insertCell(cellId++);
    cell.appendChild(element);
  }
}
</script>

<h2 class="warning">{L_adm_lng_warning}</h2>
<h2>{L_adm_lng_title}</h2>
<form method="post">
<!-- IF .domain -->
    {L_adm_lng_domain} <select name="domain">
      <!-- BEGIN domain -->
        <option value="{domain.NAME}">{domain.NAME}</option>
      <!-- END domain -->
    </select>
    <input type="submit">
<!-- ELSEIF .language -->
  <h3>{L_adm_lng_domain} {DOMAIN}</h3>
  <input type="hidden" name="domain" value="{DOMAIN}">
  <table id="localeStrings">
   <tr>
     <th class="c_c">X</th>
     <th class="c_l">{L_adm_lng_string_name}</th>
     <!-- BEGIN language -->
       <script language="javascript">
         lang_list['{language.LANG_NAME_ISO2}'] = '{language.LANG_NAME_ISO2}';
       </script>
       <th class="c_l">{language.LANG_NAME_NATIVE}</td>
     <!-- END language -->
   </tr>
  <!-- BEGIN string -->
    <tr>
      <td class="c_c" onclick="this.parentElement.parentElement.removeChild(this.parentElement);">X</td>
      <td class="c_l">{string.NAME}</td>
      <!-- BEGIN locale -->
        <td><input type="text" size=30 name="lang_new{string.NAME}[{locale.LANG}]" value="{locale.VALUE}"></td>
      <!-- END local -->
    </tr>
  <!-- END string -->
  <tr>
    <th class="c_c" colspan=4>
      <input class="fl" type="button" value="{L_adm_lng_string_add}" onclick="addRow();">
      <input class="fr" type="submit" value="{L_sys_save}">
    </th>
  </tr>
  </table>
<!-- ENDIF -->
</form>
