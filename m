Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3652436F926
	for <lists+linux-leds@lfdr.de>; Fri, 30 Apr 2021 13:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhD3LWQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Apr 2021 07:22:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40944 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229543AbhD3LWO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 30 Apr 2021 07:22:14 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13UB4WeQ121487;
        Fri, 30 Apr 2021 07:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=BOUdY3Bj3TagE2GIAKMgGQw0z0/KA3ke7c5xOFO2ZEU=;
 b=ExN2YOzr+0DZJ5JoxOP0e+5TuE4CdmfiPWP7BPSvhFq/hxaWpsOfqrEHfZuh3CiieUZM
 AyvLOPuDCMWDFBGIsoiMLWZc94Qa97/TZc5rKKh/d5vYTOZMB+6fsEz3hOBMrkHbAS/R
 sJONEWCopqNbNzXYd8SzUaHpLlzRclY51YhXR7Bx5BtdOjHqaP8MR8Evp9QHD7JE+g57
 SkugR04uWtlSYsq8NLxaOZsTGfuVMInwkhw0dBkHIYbXZl3oqeC1xjv/SLQd5AvUWAD+
 z1Hgf6KmevO2OaA5pK/lj14nemWascoumj+KUusZpTAJiMeA2XPezPaBpK1WaDc2PUia OA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 388g64scrk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Apr 2021 07:21:21 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13UB4dsC121768;
        Fri, 30 Apr 2021 07:21:21 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0b-001b2d01.pphosted.com with ESMTP id 388g64scqp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Apr 2021 07:21:21 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UBJovU022058;
        Fri, 30 Apr 2021 11:21:19 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma03fra.de.ibm.com with ESMTP id 384ay8sq4q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Apr 2021 11:21:19 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13UBLF9432833902
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Apr 2021 11:21:15 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A3AFF5204E;
        Fri, 30 Apr 2021 11:21:15 +0000 (GMT)
Received: from [9.85.118.107] (unknown [9.85.118.107])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 28DF452050;
        Fri, 30 Apr 2021 11:21:14 +0000 (GMT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH 1/5] dt-bindings: leds: Add retain-state-shutdown boolean
From:   vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <5e55a124f57186e95498e30d54ef6f9d7d671dbe.camel@linux.ibm.com>
Date:   Fri, 30 Apr 2021 16:51:12 +0530
Cc:     vishwanatha subbanna <vishwa@linux.vnet.ibm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        vishwa@linux.ibm.com
Content-Transfer-Encoding: 7bit
Message-Id: <10EE2BF5-4ABF-4794-A2B0-276B074038BA@linux.vnet.ibm.com>
References: <20210429205002.70245-1-eajames@linux.ibm.com>
 <20210429205002.70245-2-eajames@linux.ibm.com>
 <5e55a124f57186e95498e30d54ef6f9d7d671dbe.camel@linux.ibm.com>
To:     Eddie James <eajames@linux.ibm.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: saMRG6g4WQ8jMB3D1IIqRLcr9zUr9WRS
X-Proofpoint-ORIG-GUID: Ci0IUqmla4V97CI8obcgO97SAfsp_VRL
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-30_06:2021-04-30,2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 clxscore=1011 phishscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300080
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



> On 30-Apr-2021, at 2:30 AM, Eddie James <eajames@linux.ibm.com> wrote:
> 
> On Thu, 2021-04-29 at 15:49 -0500, Eddie James wrote:
>> Document the retain-state-shutdown property that indicates that a LED
>> should not be turned off or changed during system shutdown.
> 
> Lost a character of Rob's email, so bumping this one with the right
> address.
> 
> Sorry,
> Eddie
> 
>> 

Reviewed-by: Vishwanatha Subbanna <vishwanath@linux.vnet.ibm.com>


>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>> Documentation/devicetree/bindings/leds/common.yaml | 6 ++++++
>> 1 file changed, 6 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/leds/common.yaml
>> b/Documentation/devicetree/bindings/leds/common.yaml
>> index b1f363747a62..697102707703 100644
>> --- a/Documentation/devicetree/bindings/leds/common.yaml
>> +++ b/Documentation/devicetree/bindings/leds/common.yaml
>> @@ -128,6 +128,12 @@ properties:
>>       as a panic indicator.
>>     type: boolean
>> 
>> +  retain-state-shutdown:
>> +    description:
>> +      This property specifies that the LED should not be turned off
>> or changed
>> +      when the system shuts down.
>> +    type: boolean
>> +
>>   trigger-sources:
>>     description: |
>>       List of devices which should be used as a source triggering
>> this LED
> 

