Return-Path: <linux-leds+bounces-264-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BBF806DED
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 12:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E78A1C209A4
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 11:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABF531755;
	Wed,  6 Dec 2023 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="AA4Sss6q"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86AC210A;
	Wed,  6 Dec 2023 03:30:02 -0800 (PST)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4D0CE10005E;
	Wed,  6 Dec 2023 14:29:59 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4D0CE10005E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1701862199;
	bh=vNxXeAowednmOMP3lRMoLv0eg+bQqxfTIG2s7U0+4xE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=AA4Sss6q0+ayb8AfT1f4+oWUiPZ9XFYrrTAp1FevXfGDhXveDFok2v8s8+aex+ya2
	 WoVYT2Rgjw+cCdLas26KuYjyEPMvFt8NpfyNPJjGi26ANC6NF3UDS5HT48SsPyJFi6
	 X/ZCe7duuWVAf2XyooCYTtZRD6Vm3FlKiz00ZzamczGC9gQuyPZqHjaWom8N/RghmO
	 2x97CpnFSfpyFS5GpgFO17HwwYC1uHHLK26j+FlwFd6UnW7jZ0DoU3HHi4urYLq7Vh
	 AVEi5sWLbkfh9cKh8bkvo2cZyRYHBSGen5M6laiMZ3dz7I+/5c9b76Nnr3BHcJm11V
	 U7nPuDXHI99nw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  6 Dec 2023 14:29:59 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 14:29:58 +0300
Date: Wed, 6 Dec 2023 14:29:58 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Lee Jones <lee@kernel.org>
CC: <pavel@ucw.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <andy.shevchenko@gmail.com>, <kernel@sberdevices.ru>,
	<rockosov@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v5 00/11] leds: aw200xx: several driver updates
Message-ID: <20231206112958.xlzrzorkzzexwpwe@CAB-WSD-L081021>
References: <20231125200519.1750-1-ddrokosov@salutedevices.com>
 <170142898612.3365188.2222761548333694548.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170142898612.3365188.2222761548333694548.b4-ty@kernel.org>
User-Agent: NeoMutt/20220415
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181895 [Dec 06 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 5 0.3.5 98d108ddd984cca1d7e65e595eac546a62b0144b, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/12/06 07:39:00 #22618292
X-KSMG-AntiVirus-Status: Clean, skipped

Hello Lee,

On Fri, Dec 01, 2023 at 11:09:46AM +0000, Lee Jones wrote:
> On Sat, 25 Nov 2023 23:05:08 +0300, Dmitry Rokosov wrote:
> > The following patch series includes several updates for the AW200XX LED
> > driver:
> >     - some small fixes and optimizations to the driver implementation:
> >       delays, autodimming calculation, disable_locking regmap flag,
> >       display_rows calculation in runtime;
> >     - fix LED device tree node pattern to accept LED names counting not
> >       only from 0 to f;
> >     - add missing reg constraints;
> >     - support HWEN hardware control, which allows enabling or disabling
> >       AW200XX RTL logic from the main SoC using a GPIO pin;
> >     - introduce the new AW20108 LED controller, the datasheet for this
> >       controller can be found at [1].
> > 
> > [...]
> 
> Applied, thanks!
> 
> [01/11] leds: aw200xx: fix write to DIM parameter
>         commit: 785fec3a8daff2957fd55e49cbdfe0a50866fdb7
> [02/11] leds: aw200xx: support HWEN hardware control
>         commit: eabe8239022cf3c75b90d9ee07dcfbbe4e50bcac
> [03/11] dt-bindings: leds: aw200xx: introduce optional enable-gpios property
>         commit: e91899ea3759d04e185721153a036e1a25e315b7
> [04/11] leds: aw200xx: calculate dts property display_rows in the driver
>         commit: 4ccd392c3ea7ceefbee58622e634d4997ef46acc
> [05/11] dt-bindings: leds: aw200xx: remove property "awinic,display-rows"
>         commit: 66d078f105837670c52bb31da29e26ad13bc2923
> [06/11] leds: aw200xx: add delay after software reset
>         commit: aac13e5630d6e081a9f6c5a57e5e6fc1152acca8
> [07/11] leds: aw200xx: enable disable_locking flag in regmap config
>         commit: 851fa70b9b162bbf5b5f5f92fc450633e6b21a3a
> [08/11] leds: aw200xx: improve autodim calculation method
>         commit: 5fcc24b92b43f012cbf430244f0698ff588ec9fc
> [09/11] leds: aw200xx: add support for aw20108 device
>         commit: abc74724d5e714bb3359124f3576d5318828a83e
> [10/11] dt-bindings: leds: awinic,aw200xx: add AW20108 device
>         commit: d6bbe677add2c560ae4aa2f9dab7a19c287e2193
> [11/11] dt-bindings: leds: aw200xx: fix led pattern and add reg constraints
>         commit: 5707a06e5391a4eeaf0c2705f973336537a41c79

Thank you for applying the patch series!

Could you please advise where I can find the above commits? I've tried
looking in the 'lee/leds' branch, but I couldn't find anything. I want
to cherry-pick the commits that you applied to my internal branch, which
I sync with the upstream periodically.

-- 
Thank you,
Dmitry

