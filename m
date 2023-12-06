Return-Path: <linux-leds+bounces-273-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E739D807165
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 14:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8687CB20E24
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 13:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA913BB2E;
	Wed,  6 Dec 2023 13:57:37 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10160D4B;
	Wed,  6 Dec 2023 05:57:33 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=1718b185fc=fe@dev.tdt.de>)
	id 1rAsOx-00BDnq-2a; Wed, 06 Dec 2023 14:57:23 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <fe@dev.tdt.de>)
	id 1rAsOw-008UL4-3c; Wed, 06 Dec 2023 14:57:22 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id B3298240049;
	Wed,  6 Dec 2023 14:57:21 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 0FAD2240040;
	Wed,  6 Dec 2023 14:57:21 +0100 (CET)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id 832A534045;
	Wed,  6 Dec 2023 14:57:20 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 06 Dec 2023 14:57:20 +0100
From: Florian Eckert <fe@dev.tdt.de>
To: Lee Jones <lee@kernel.org>
Cc: Eckert.Florian@googlemail.com, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, pavel@ucw.cz, kabel@kernel.org,
 u.kleine-koenig@pengutronix.de, m.brock@vanmierlo.com,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-leds@vger.kernel.org
Subject: Re: [Patch v8 0/6] ledtrig-tty: add additional tty state evaluation
In-Reply-To: <20231206134719.GF3375667@google.com>
References: <20231109085038.371977-1-fe@dev.tdt.de>
 <170142723852.3350831.6373465907279189004.b4-ty@kernel.org>
 <8acd2694429af4f7205db7d7bb39eab6@dev.tdt.de>
 <20231206134719.GF3375667@google.com>
Message-ID: <e69d088b1aedfef330eace35699670c6@dev.tdt.de>
X-Sender: fe@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
X-purgate: clean
X-purgate-type: clean
X-purgate-ID: 151534::1701871042-6E8D6018-0224B478/0/0



On 2023-12-06 14:47, Lee Jones wrote:
> On Fri, 01 Dec 2023, Florian Eckert wrote:
>> On 2023-12-01 11:40, Lee Jones wrote:

>> > Applied, thanks!
>> >
>> > [1/6] tty: add new helper function tty_get_tiocm
>> >       commit: 5d11a4709f552fa139c2439fead05daeb064a6f4
>> > [2/6] leds: ledtrig-tty: free allocated ttyname buffer on deactivate
>> >       (no commit info)
>> > [3/6] leds: ledtrig-tty: change logging if get icount failed
>> >       (no commit info)
>> > [4/6] leds: ledtrig-tty: replace mutex with completion
>> >       (no commit info)
>> > [5/6] leds: ledtrig-tty: make rx tx activitate configurable
>> >       (no commit info)
>> > [6/6] leds: ledtrig-tty: add additional line state evaluation
>> >       (no commit info)
>> 
>> I think that was a mistake? Patchset v9 is the correct patchset [1]?
>> 
>> Thanks for applying v9 [1]
> 
> It's automated.  Not sure what happened now.
> 
> Please check to ensure the correct set was applied.

I have checked that v9 is appled to the branch for-leds-next [1].
I can confirm that v9 patchset is applied there.

Thanks

Best regards

Florian

Links:
[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/log/?h=for-leds-next

