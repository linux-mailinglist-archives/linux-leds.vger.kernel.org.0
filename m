Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B50B332331D
	for <lists+linux-leds@lfdr.de>; Tue, 23 Feb 2021 22:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233343AbhBWVPs convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Tue, 23 Feb 2021 16:15:48 -0500
Received: from smtpx.feld.cvut.cz ([147.32.210.153]:52147 "EHLO
        smtpx.feld.cvut.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233482AbhBWVOC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2021 16:14:02 -0500
Received: from localhost (styx [192.168.200.7])
        by smtpx.feld.cvut.cz (Postfix) with ESMTP id 526791468F;
        Tue, 23 Feb 2021 22:13:14 +0100 (CET)
X-Virus-Scanned: IMAP STYX AMAVIS
Received: from smtpx.feld.cvut.cz ([192.168.200.2])
        by localhost (styx.feld.cvut.cz [192.168.200.7]) (amavisd-new, port 10060)
        with ESMTP id P3RSco2TkvsR; Tue, 23 Feb 2021 22:13:12 +0100 (CET)
Received: from imap.feld.cvut.cz (imap.feld.cvut.cz [147.32.210.222])
        by smtpx.feld.cvut.cz (Postfix) with ESMTP id 010B51447C;
        Tue, 23 Feb 2021 22:13:11 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2] leds: apu: extend support for PC Engines APU1 with
 newer firmware
From:   =?utf-8?Q?Zbyn=C4=9Bk_Kocur?= <zbynek.kocur@fel.cvut.cz>
In-Reply-To: <54ec502e-2607-3096-d69f-d0c13fc1ba24@metux.net>
Date:   Tue, 23 Feb 2021 22:13:10 +0100
Cc:     =?utf-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <1AE7260F-ED0D-4B55-986F-2498CD7A58D8@fel.cvut.cz>
References: <20210216133028.4025-1-foodeas@aeberlein.de>
 <c7eebbb6-df0c-51df-7701-ecb8f6543466@metux.net>
 <20210219143711.GA28202@meh.true.cz>
 <1E2EF21D-A304-46C4-9370-4FEBFD4767D2@fel.cvut.cz>
 <54ec502e-2607-3096-d69f-d0c13fc1ba24@metux.net>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

I checked my stock and I have following models:

- apu2e2
- apu2e4
- apu3d4
- apu4c4

The bios in all models can be upgraded from version 4.0.6 to higher. The latest is 4.13.0.3.

Zbyněk
---
email: zbynek.kocur@fel.cvut.cz
mobile: +420 728 946 803
phone: +420 224 354 054
web: https://comtel.fel.cvut.cz
Department of Telecommunications Engineering
Faculty of Electrical Engineering

> On 23. 2. 2021, at 21:02, Enrico Weigelt, metux IT consult <info@metux.net> wrote:
> 
> On 19.02.21 21:51, Zbyněk Kocur wrote:
> 
> Hi Zbyněk,
> 
>> Thanks for adding to the discussion. I tested the proposed modification on APU1 with different versions of bios.
>> The LED subsystem now behaves the same as the APU2 and higher. If it needs more tests on various boards
>>  from PCengines, I'm available.
> 
> Do you also happen to have different apu2/3/4 boards (various hw revs
> and bios versions) for testing ? I've still got some open issues, eg.
> regarding pcie reset lines, etc.
> 
> 
> --mtx
> 
> -- 
> ---
> Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
> werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
> GPG/PGP-Schlüssel zu.
> ---
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287

