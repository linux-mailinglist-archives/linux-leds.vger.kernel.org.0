Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345BB21D879
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 16:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729970AbgGMO2n (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 10:28:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2056 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729782AbgGMO2m (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 13 Jul 2020 10:28:42 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06DE3bC7109961;
        Mon, 13 Jul 2020 10:28:36 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 328s0c8tjp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Jul 2020 10:28:36 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06DE4UES114776;
        Mon, 13 Jul 2020 10:28:35 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com with ESMTP id 328s0c8thf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Jul 2020 10:28:35 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06DEETXs015468;
        Mon, 13 Jul 2020 14:28:34 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
        by ppma02wdc.us.ibm.com with ESMTP id 327urs9mkj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Jul 2020 14:28:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06DESUi730998968
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Jul 2020 14:28:30 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6018A78064;
        Mon, 13 Jul 2020 14:28:33 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0455D7805C;
        Mon, 13 Jul 2020 14:28:32 +0000 (GMT)
Received: from [9.163.41.130] (unknown [9.163.41.130])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon, 13 Jul 2020 14:28:32 +0000 (GMT)
Subject: Re: [PATCH 1/2] dt-bindings: leds: pca955x: Add IBM implementation
 compatible string
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, dmurphy@ti.com,
        jacek.anaszewski@gmail.com, vishwa@linux.ibm.com
References: <20200709201220.13736-1-eajames@linux.ibm.com>
 <20200709201220.13736-2-eajames@linux.ibm.com> <20200711134814.GB6407@amd>
From:   Eddie James <eajames@linux.ibm.com>
Message-ID: <ad50a2a7-0b06-420e-baa7-dec2787ab30d@linux.ibm.com>
Date:   Mon, 13 Jul 2020 09:28:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200711134814.GB6407@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-13_11:2020-07-13,2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007130102
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 7/11/20 8:48 AM, Pavel Machek wrote:
> Hi!
>
>> IBM created an implementation of the PCA9552 on a PIC16F
>> microcontroller. Document the new compatible string for this device.
> Is the implementation opensource?


Hi, no it is not.


>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> +++ b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
>> @@ -9,6 +9,7 @@ Required properties:
>>   	"nxp,pca9550"
>>   	"nxp,pca9551"
>>   	"nxp,pca9552"
>> +	"nxp,pca9552-ibm"
>>   	"nxp,pca9553"
> Is it good idea to use nxp prefix for something that is
> software-defined and not built by nxp?


Yea I suppose not...

>
> Would ibm,pca9552 be better, or maybe even sw,pca9552 to indicate that
> is not real hardware, but software emulation?


How about ibm,pca9552-sw? Someone suggested that just adding "sw" could 
be a problem if another company does the same thing but it isn't compatible.


Thanks for taking a look!

Eddie


>
> Best regards,
> 									Pavel
