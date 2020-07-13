Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B23E21D880
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 16:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729681AbgGMOaB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 10:30:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3458 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729659AbgGMOaB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 13 Jul 2020 10:30:01 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06DE2A0s154676;
        Mon, 13 Jul 2020 10:29:55 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3277rcyu1j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Jul 2020 10:29:55 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06DE2qM4158433;
        Mon, 13 Jul 2020 10:29:55 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3277rcyu0x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Jul 2020 10:29:55 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06DEG5ZH015821;
        Mon, 13 Jul 2020 14:29:53 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
        by ppma03wdc.us.ibm.com with ESMTP id 327528rmej-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Jul 2020 14:29:53 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06DEToaT4325982
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Jul 2020 14:29:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9A84678063;
        Mon, 13 Jul 2020 14:29:52 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 233677805E;
        Mon, 13 Jul 2020 14:29:52 +0000 (GMT)
Received: from [9.163.41.130] (unknown [9.163.41.130])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon, 13 Jul 2020 14:29:52 +0000 (GMT)
Subject: Re: [PATCH 2/2] leds: pca955x: Add an IBM software implementation of
 the PCA9552 chip
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        vishwa@linux.ibm.com
References: <20200709201220.13736-1-eajames@linux.ibm.com>
 <20200709201220.13736-3-eajames@linux.ibm.com>
 <CAHp75VcE9skpqa32bZ4AAcOa08WYSqqZodnveLSF+sZej5KnWw@mail.gmail.com>
From:   Eddie James <eajames@linux.ibm.com>
Message-ID: <3077dcbb-70e3-f460-b957-95d11c47be2a@linux.ibm.com>
Date:   Mon, 13 Jul 2020 09:29:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcE9skpqa32bZ4AAcOa08WYSqqZodnveLSF+sZej5KnWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-13_11:2020-07-13,2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007130102
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 7/9/20 3:50 PM, Andy Shevchenko wrote:
> On Thu, Jul 9, 2020 at 11:16 PM Eddie James <eajames@linux.ibm.com> wrote:
>> IBM created an implementation of the PCA9552 on a PIC16F
>> microcontroller. The I2C device addresses are different from the
>> hardware PCA9552, so add a new compatible string and associated
>> platform data to be able to probe this device.
> This is weird. I would rather expect ibm prefix with corresponding part number.


Yep I agree now, see my note to Pavel just now.


Thanks,

Eddie


>
>> +       pca9552_ibm,
>> +       [pca9552_ibm] = {
>> +       { "pca9552-ibm", pca9552_ibm },
>> +       { .compatible = "nxp,pca9552-ibm", .data = (void *)pca9552_ibm },
>
