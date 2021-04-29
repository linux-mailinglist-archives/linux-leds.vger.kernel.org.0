Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73B1C36F17E
	for <lists+linux-leds@lfdr.de>; Thu, 29 Apr 2021 23:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbhD2VBc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Apr 2021 17:01:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31117 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233097AbhD2VBb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Apr 2021 17:01:31 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13TKYBIG012993;
        Thu, 29 Apr 2021 17:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Xgqqc0RPhCoOpnWlWCwPmBpEcrWbP+4/YtDT9h+84WE=;
 b=daMUzyfwboJizTbJkpzvmPxGrAyfI5R8fI0kWcyNbVKXxD4z9n44aX2IRVvnUI9CvOI7
 TaxfI7AKK+ugc1j6SUOZiq/K/wEEM2a1h0rd47lUpKTbQ6co35HeejOnJ1LaIB7dTMeJ
 5Uhjcb+yvA2qIqjd58VUCAiWpR3bb75kuw3YuzuHelbFcCmuOyEfNAlG+Tk0hrVzz18u
 F/fWH8CXf10Sw2pQesZFF/R67nH56cG0Md6+RMiY2ayAmSYmMSMVb2MZuse5Hp8UYq3w
 roaRRsYj4+qipujFb1EBHXCjsHWLm//k9AeBz7cB2/3hVETIagyI7j+IFCjrakhkv+VR MA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3883txrqm6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 17:00:41 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13TKYupe018418;
        Thu, 29 Apr 2021 17:00:40 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3883txrqky-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 17:00:40 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TKjnVi020093;
        Thu, 29 Apr 2021 21:00:40 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma01wdc.us.ibm.com with ESMTP id 384ay9y2u9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 21:00:40 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13TL0dec22806998
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 21:00:39 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 138F9C605D;
        Thu, 29 Apr 2021 21:00:39 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B4472C6057;
        Thu, 29 Apr 2021 21:00:38 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.73.43])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Thu, 29 Apr 2021 21:00:38 +0000 (GMT)
Message-ID: <5e55a124f57186e95498e30d54ef6f9d7d671dbe.camel@linux.ibm.com>
Subject: Re: [PATCH 1/5] dt-bindings: leds: Add retain-state-shutdown boolean
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, pavel@ucw.cz,
        jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, vishwa@linux.ibm.com
Date:   Thu, 29 Apr 2021 16:00:38 -0500
In-Reply-To: <20210429205002.70245-2-eajames@linux.ibm.com>
References: <20210429205002.70245-1-eajames@linux.ibm.com>
         <20210429205002.70245-2-eajames@linux.ibm.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RNlEDZJ-x_SsVUGbqKGQTpIvRA_D9wvN
X-Proofpoint-ORIG-GUID: nMfFNRqmol6F8UuVLIiP7ElskYE-8wjk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-29_11:2021-04-28,2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104290133
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 2021-04-29 at 15:49 -0500, Eddie James wrote:
> Document the retain-state-shutdown property that indicates that a LED
> should not be turned off or changed during system shutdown.

Lost a character of Rob's email, so bumping this one with the right
address.

Sorry,
Eddie

> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml
> b/Documentation/devicetree/bindings/leds/common.yaml
> index b1f363747a62..697102707703 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -128,6 +128,12 @@ properties:
>        as a panic indicator.
>      type: boolean
>  
> +  retain-state-shutdown:
> +    description:
> +      This property specifies that the LED should not be turned off
> or changed
> +      when the system shuts down.
> +    type: boolean
> +
>    trigger-sources:
>      description: |
>        List of devices which should be used as a source triggering
> this LED

