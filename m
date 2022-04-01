Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF8AA4EEF1A
	for <lists+linux-leds@lfdr.de>; Fri,  1 Apr 2022 16:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346704AbiDAOT1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 1 Apr 2022 10:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346597AbiDAOT0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 1 Apr 2022 10:19:26 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC0628254D;
        Fri,  1 Apr 2022 07:17:37 -0700 (PDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231DCe4t004568;
        Fri, 1 Apr 2022 14:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=j+GrgQwSNP6LhnjiDCskOWjxGf/kQMb9FWXh3SM6zZY=;
 b=L02HjvnV5//Swk5/pi0Oakf0r6E5nFlWyExEyF4nVFYBycUizttE3TY81IW1/578xmzf
 JrEO6EFFehin9pH0OkC0J6awWPLBaCEvDnrWLGDUtg7COPWIqSmDc1gAPE42jutj9In3
 jQwcKwJ+YbFDj2cuvus/zedi6iVrmHdeKtHTo4fUvz5V2VsXWeen9/kcbAHh7ioqWTI7
 y8DBQyDMhoNS5HKsMDw2lwfmmf0OsE8CBX+gfx4Ap29E2J67YhYXNvqkrHuWNc3m/hws
 LhrPXDH5c1K+i21Dq+bLFnim1Q7RUv8VFbOe83MwZnuR/L9nwUNEOEZwc//Pds7Tx+Td Nw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3f60ds44ax-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 01 Apr 2022 14:17:27 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 231EDXEF013373;
        Fri, 1 Apr 2022 14:17:26 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma01dal.us.ibm.com with ESMTP id 3f5y5r1ybr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 01 Apr 2022 14:17:26 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 231EHPpg32899400
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 1 Apr 2022 14:17:25 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0F7F3BE054;
        Fri,  1 Apr 2022 14:17:25 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B5566BE056;
        Fri,  1 Apr 2022 14:17:24 +0000 (GMT)
Received: from [9.211.155.52] (unknown [9.211.155.52])
        by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
        Fri,  1 Apr 2022 14:17:24 +0000 (GMT)
Message-ID: <82528887-a6e9-f7cc-26f3-6a0932d967c9@linux.ibm.com>
Date:   Fri, 1 Apr 2022 09:17:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] leds: pca955x: Add HW blink support
Content-Language: en-US
To:     Patrick Williams <patrick@stwcx.xyz>
Cc:     pavel@ucw.cz, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        joel@jms.id.au
References: <20220330203318.19225-1-eajames@linux.ibm.com>
 <YkXLG++LWdQWCxQF@heinlein>
From:   Eddie James <eajames@linux.ibm.com>
In-Reply-To: <YkXLG++LWdQWCxQF@heinlein>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4K5KvNpjB3ggIrLj-E8OVtJgVj3KKUFO
X-Proofpoint-GUID: 4K5KvNpjB3ggIrLj-E8OVtJgVj3KKUFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-01_05,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1011 mlxscore=0 priorityscore=1501 mlxlogscore=796
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204010066
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 3/31/22 10:39, Patrick Williams wrote:
> On Wed, Mar 30, 2022 at 03:33:18PM -0500, Eddie James wrote:
>> Support blinking using the PCA955x chip. Use PWM0 for blinking
>> instead of LED_HALF brightness. Since there is only one frequency
>> and brightness register for any blinking LED, all blinked LEDs on
>> the chip will have the same frequency and brightness.
> The current implementation uses the PWM to control the "brightness"
> with PWM0 being assigned 50% and PWM1 being configured as a single value
> that isn't ON, OFF, or 50%.  I suspect that most users of these 955x
> chips care either about brightness or blinking but not both, but it is
> possible I am wrong.  It would be nice if we could use PWM1 as another
> hardware blink control when it hasn't been used for brightness, but that
> would require some additional state tracking I think.
>
> I like that we can now use the hardware to control blink rate, rather
> than doing it in software, and, I really like that in theory if N LEDs on
> the device are all blinking at the same rate they will actually turn on and
> off at the same exact moment because it is done in hardware.  I am really
> concerned about this proposed change and the way it will change current
> behavior though.
>
> It is not uncommon in a BMC design to use one of these 955x chips to control
> 8 or 16 different LEDs reflecting the state of the system and at
> different blink rates.  An example LED policy might be that you have 1 LED
> for "power status" and another LED for "system identify + health status".
> When the system is powered off the "power status" LED flashes at a slow rate
> and when the system is powered on it goes on solid.  When the system is healthy
> the "health status" is on, when it is unhealthy it blinks slowly, and when the
> system is "identified" it blinks fast.
>
> My point of the above is that there are certainly system policies where
> you'd want to flash two different LEDs at two different rates.  In
> today's implementation of this driver those both turn into
> software-emulated blinking by the kernel.  With your proposal we lose
> this ability and instead whichever LED is configured second will affect
> all other blinking LEDs.


Yep. I see your point, it could be problematic.


>
> It looks like in led-core.c led_blink_setup that if the device
> `blink_set` returns an error then software blinking is the fallback.  Is
> it possible for us to have this driver keep track of how many LEDs are
> in blink state (and which speeds are allocated) and get led-core to
> fallback to software blinking if we are unable to satisfy the new blink
> rate without affecting an existing LED blink rate?


OK, I like this idea, I'll go ahead and implement it. Thanks for the 
suggestion!


Eddie


>
> Looking at the tree it seems bcm6328 does what I am suggesting already
> but I don't see any other drivers that obviously do.  The PCA955x is
> pretty widely used in BMC implementations:
>
>      $ git grep -l pca955 arch/arm/boot/dts/aspeed* | wc -l
>      13
>
