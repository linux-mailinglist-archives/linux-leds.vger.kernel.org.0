Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4677287713
	for <lists+linux-leds@lfdr.de>; Thu,  8 Oct 2020 17:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730878AbgJHP1p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Oct 2020 11:27:45 -0400
Received: from w1.tutanota.de ([81.3.6.162]:33514 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730550AbgJHP1p (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 8 Oct 2020 11:27:45 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id C0BE7FA003A;
        Thu,  8 Oct 2020 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1602170863;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=4tUhvZae2CaRGaj9CmoS516TRIpLQRFgwli850r4wxI=;
        b=AZxLeRR8FBn1MZd4D0nVcj57FPFQngpeS9VFl9KygtF2hT8aMr7nL+L3LtMS0Wvx
        Eyr4wIuqb8EdY8zhvF8MQSz/8SLGny/vgInF0QijjvjTfIZnn0bmrmgQ85meR6/df9J
        WUrEoCY/KNUBOhr/Ua2jDGCxQarILaITvSdKLMrbL5f2GND9QkAJj2ArX3x5+shZBnn
        rt1Jo1JHreBLTGQno7BYE/xUvGBQvUmQSB6ykCYid0A9kHac2ZP9K+0IKj1WLeIoaoU
        HCA9UStPyVPXCmXqaYS+8vY6NcR0CtZI8oktqBKHtq/pucsrptSiOM0kdOIhm4mR+Dg
        CVvhsyiivg==
Date:   Thu, 8 Oct 2020 17:27:43 +0200 (CEST)
From:   ultracoolguy@tutanota.com
To:     Dan Murphy <dmurphy@ti.com>, Pavel <pavel@ucw.cz>
Cc:     Marek Behun <kabel@blackhole.sk>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Message-ID: <MJ7onrW--7-2@tutanota.com>
In-Reply-To: <MJ76lXD--3-2@tutanota.com>
References: <MIuPIKy--3-2@tutanota.com> <20201007012600.3b3e7779@blackhole.sk> <MJ2-gcy----2@tutanota.com> <346621c1-757e-d182-d290-877fccc8b4aa@ti.com> <MJ76lXD--3-2@tutanota.com>
Subject: Re: [PATCH] lm3697: Rename struct into more appropiate name
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


Umm:

<linux-kernel@vger.kernel.org>: host vger.kernel.org[23.128.96.18] said: 553
    5.7.1 Hello [178.21.23.139], for your MAIL FROM address
    <ultracoolguy@disroot.org> policy analysis reported: Your address is not
    liked source for email (in reply to MAIL FROM command)Is disroot.org banned?

Oct 8, 2020, 12:10 by ultracoolguy@tutanota.com:

> Gotcha.
>
> From now on I'm gonna respond with this new email: > ultracoolguy@disroot.org>  .
>
> Oct 7, 2020, 14:56 by dmurphy@ti.com:
>
>> Gabriel
>>
>> On 10/7/20 7:21 AM, ultracoolguy@tutanota.com wrote:
>>
>>> The reason I didn't use git send-mail earlier is because Tutanota doesn't supports SMTP and Protonmail requires a paid account for using SMTP/IMAP. However, I made an account creation request for Disroot(which does support SMTP for free), so when/if the account gets created I'll send future patches through there.
>>> Oct 6, 2020, 23:26 by kabel@blackhole.sk:
>>>
>> Also please note top posting on emails is not preferred. As you will find in the LED domain bottom posts and trimming emails to what is being commented on is preferred.
>>
>> As demonstrated.
>>
>> Dan
>>
>
>

