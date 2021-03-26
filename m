Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E2434B16E
	for <lists+linux-leds@lfdr.de>; Fri, 26 Mar 2021 22:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbhCZVlZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Mar 2021 17:41:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29402 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230139AbhCZVlW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Mar 2021 17:41:22 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12QLY9bW175064;
        Fri, 26 Mar 2021 17:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=o3ApsbpnhFyVWmIh60cjgwBmlVuw5nAPAdbum6OWuuo=;
 b=bjorKQvjKds+BnXhPDlPj4fBrDMe1QTrvGcoqddKvRmuFiVGdImuvNyiID5G7TMRfrEy
 LVCJuT8V8ON2Mg7sNEx2amsW/YMzHmwLSeJuH0CuXmQmtZfdUuIcm7V3MGs2oayOoIdp
 39qWTO/j4MpXKIg86dvGanMLxCxx+WiZoQCrWsv0sHke2oWXyQZ2cdfFhBzfw76ZtFUw
 b/+uRhhO8W8Rceq9D79/GXdtv9rXi7cu3PGLVjAqvJmfXwyYfny5CZS1H1UP8ycpwTfU
 b8mLbRzL0UpYZ3YbrLBfkgKG+pKOuY03DvArWno1pnFr/7sDAxUGml5SKP5XrhjCPHny Dg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37h74w2jt5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Mar 2021 17:41:04 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12QLXUlw012720;
        Fri, 26 Mar 2021 21:41:03 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma03wdc.us.ibm.com with ESMTP id 37h15e059r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Mar 2021 21:41:03 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12QLf3MM25493806
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Mar 2021 21:41:03 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0B3B778060;
        Fri, 26 Mar 2021 21:41:03 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B3D6778066;
        Fri, 26 Mar 2021 21:41:02 +0000 (GMT)
Received: from [9.211.47.34] (unknown [9.211.47.34])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Fri, 26 Mar 2021 21:41:02 +0000 (GMT)
Subject: Re: leds: pca955x: Allow full control over led name
To:     Joel Stanley <joel@jms.id.au>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>
Cc:     =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
        linux-leds@vger.kernel.org
References: <20210325005456.152469-1-joel@jms.id.au>
From:   Eddie James <eajames@linux.ibm.com>
Message-ID: <55566731-1a4e-0e91-d5d7-7ded3739f42d@linux.ibm.com>
Date:   Fri, 26 Mar 2021 16:41:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210325005456.152469-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9YsGZwXRLSegblNDxWXzrAVwk47zBtQP
X-Proofpoint-ORIG-GUID: 9YsGZwXRLSegblNDxWXzrAVwk47zBtQP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-26_14:2021-03-26,2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260159
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 3/24/21 7:54 PM, Joel Stanley wrote:
> The PCA955x driver since it was merged has added a "pca955x:" prefix to
> LED names. This meanas platform data (such as the device tree) cannot
> fully control the name. Here's what this produces using the example in
> the device tree bindings:
>
>   # cat /sys/class/leds/
>   pca955x:green:power/
>   pca955x:pca9552:white/
>   pca955x:pca9552:yellow/
>   pca955x:red:power/
>
> Some systems want the ability to configure the full string. To do this,
> introduce a build time option that adds the prefix that defaults to
> enabled in order to preserve existing behaviour.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/leds/Kconfig        | 11 +++++++++++
>   drivers/leds/leds-pca955x.c |  8 +++++++-
>   2 files changed, 18 insertions(+), 1 deletion(-)
>
