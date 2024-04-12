  <div class="TabbedPanelsContent">
            <div style="background-color:#efefef; border-top:1px solid #ccc; border-bottom:1px solid #ccc; font-size:11px; padding:2px 4px; line-height:1.5em;"> <cfoutput>
                <cfif len(rsID.postAssessmentSent)>
                  Survey link was sent on #dateformat(rsID.postAssessmentSent)#.
                  <cfelse>
                  Survey link has not yet been sent.
                  <cfif len(rsID.postAssessmentDateToSend)>
                    <br />
                    It is currently scheduled to go out on #dateformat(rsID.postAssessmentDateToSend)#
                    <cfif rsID.CC_Assessor_onPostSend eq 1>
                      and will CC the assessor
                    </cfif>
                    .
                  </cfif>
                </cfif>
              </cfoutput> 
            </div>
            <p class="text"><strong>Post Assessment Additional Notes:</strong></p>
            <table width="100%" border="0" cellspacing="0" cellpadding="5" class="assessment">
                <tr>
                <td class="text">Post Assessment Date: </td>
                <td> 
                <input type="text" name="PostAssessDoneDate" id="PostAssessDoneDate" value="<cfoutput>#dateformat(rsID.PostAssessDoneDate,'mm/dd/yyyy')#</cfoutput>">
                </td>
              </tr>
                <tr>
                <td class="text" width="225">Post Assessment Complete:</td>
                <td><input type="checkbox" id="chkPostAssessComplete" name="chkPostAssessComplete" <cfif rsPostAssessment.isComplete EQ 1>checked</cfif> /></td>
              </tr>
                <tr>
                <td class="text">New Workstation Configuration:</td>
                <td><input type="file" id="filePostAssessWorkStation" name="filePostAssessWorkStation"  class="demo-file"/></td>
              </tr>
                <tr>
                <td colspan="2" class="text"><cftextarea name="PostSummary_Notes" cols="100" rows="10" wrap="virtual" id="PostSummary_Notes" richtext="yes" toolbar="Basic"><cfoutput>#rsPostAssessment.postAssessmentNotes#</cfoutput></cftextarea></td>
              </tr>
              <td colspan="2" class="text">
     
            <p class="text"><strong>Additional Equipment Recommendations:</strong></p>
            <table width="100%" border="0" cellspacing="2" cellpadding="2">
            <tr>
                <td width="22%" class="text">&nbsp;Keyboard Support</td>
                <td width="3%"><input name="RF22" type="checkbox" id="checkbox6" value="Yes" <cfif #rsRF_ID.RF22# EQ "Yes" >checked="checked"</cfif> /></td>
                <td class="text">&nbsp;Footrest</td>
                <td><input name="RF23" type="checkbox" id="RF23" value="Yes" <cfif #rsRF_ID.RF23# EQ "Yes" >checked="checked"</cfif> /></td>
                <td width="19%" class="text">&nbsp;Laptop Holder</td>
                <td width="3%"><input name="RF24" type="checkbox" id="RF24" value="Yes"<cfif #rsRF_ID.RF24# EQ "Yes" >checked="checked"</cfif>  /></td>
                <td class="text">&nbsp;Telephone Headset</td>
                <td><input name="RF25" type="checkbox" id="RF25" value="Yes"<cfif #rsRF_ID.RF25# EQ "Yes" >checked="checked"</cfif>  /></td>
              </tr>
            <tr>
                <td class="text">&nbsp;Corner Sleeve</td>
                <td><input name="RF26" type="checkbox" id="checkbox5" value="Yes" <cfif #rsRF_ID.RF26# EQ "Yes" >checked="checked"</cfif> /></td>
                <td class="text">&nbsp;Alternative Keyboard</td>
                <td><input name="RF27" type="checkbox" id="RF27" value="Yes" <cfif #rsRF_ID.RF27# EQ "Yes" >checked="checked"</cfif> /></td>
                <td width="21%" class="text">&nbsp;Document Holder</td>
                <td width="3%"><input name="RF28" type="checkbox" id="RF28" value="Yes" <cfif #rsRF_ID.RF28# EQ "Yes" > checked="checked" </cfif> /></td>
                <td width="24%" class="text">&nbsp;Rest Breaks</td>
                <td width="5%"><input name="RF29" type="checkbox" id="RF29" value="Yes" <cfif #rsRF_ID.RF29# EQ "Yes" >checked="checked"</cfif> /></td>
              </tr>
            <tr>
                <td class="text">&nbsp;Task Chair</td>
                <td><input name="RF30" type="checkbox" id="RF30" value="Yes" <cfif #rsRF_ID.RF30# EQ "Yes" >checked="checked"</cfif> /></td>
                <td class="text">&nbsp;Alternative Mouse</td>
                <td><input name="RF31" type="checkbox" id="checkbox15" value="Yes" <cfif #rsRF_ID.RF31# EQ "Yes" >checked="checked"</cfif> /></td>
                <td class="text">&nbsp;External Webcam</td>
                <td><input name="RF32" type="checkbox" id="RF32" value="Yes" <cfif #rsRF_ID.RF32# EQ "Yes" >checked="checked"</cfif>  /></td>
                <td class="text">&nbsp;Medical Attention</td>
                <td width="5%"><input name="RF33" type="checkbox" id="RF33" value="Yes" <cfif #rsRF_ID.RF33# EQ "Yes" >checked="checked"</cfif>  /></td>
              </tr>
            <tr>
                <td class="text">&nbsp;Monitor Arm</td>
                <td><input name="RF34" type="checkbox" id="RF34" value="Yes" <cfif #rsRF_ID.RF34# EQ "Yes" >checked="checked"</cfif>  /></td>
                <td class="text">&nbsp;Palm Support</td>
                <td><input name="RF35" type="checkbox" id="RF35" value="Yes" <cfif #rsRF_ID.RF35# EQ "Yes" >checked="checked"</cfif>  /></td>
                <td class="text">&nbsp;Sit/Stand Desk</td>
                <td><input name="RF36" type="checkbox" id="RF36" value="Yes" <cfif #rsRF_ID.RF36# EQ "Yes" >checked="checked"</cfif> /></td>
                <td colspan="2" class="text">&nbsp;Other:
                <cfinput name="other" type="text" value="#rsRF_ID.other#" maxlength="21" class="inputs inputsB"/></td>
              </tr>
            <tr>
                <td class="text">&nbsp;Task Light</td>
                <td><input name="RF37" type="checkbox" id="checkbox8" value="Yes" <cfif #rsRF_ID.RF37# EQ "Yes" >checked="checked"</cfif> /></td>
                <td class="text">&nbsp;Lap Desk</td>
                <td><input name="RF38" type="checkbox" id="RF38" value="Yes" <cfif #rsRF_ID.RF38# EQ "Yes" >checked="checked"</cfif>  /></td>
                <td class="text">&nbsp;Sit/Stand Device</td>
                <td width="5%"><input name="RF39" type="checkbox" id="RF39" value="Yes" <cfif #rsRF_ID.RF39# EQ "Yes" >checked="checked"</cfif>  /></td>
              </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
          </table>
      
              
              </td>
              </tr>
              </table>
</div>