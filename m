Return-Path: <linux-leds+bounces-555-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F4A82825C
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 09:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B56331C23A81
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 08:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79BB224E9;
	Tue,  9 Jan 2024 08:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuWatw6J"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54662E62C;
	Tue,  9 Jan 2024 08:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750A0C433F1;
	Tue,  9 Jan 2024 08:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704789777;
	bh=wvbOWsBu/GFSrGZZYWJo8c9ze6ep2XDwY3+Wzwg1oyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BuWatw6JcD48dpEHqPmfv0m6sL3TparGQbYAILD8GyC3kOBYG0+kTQokA8Vd8MK7k
	 d4TtSS7ojQMbcD8uY31NogV2LbjIBx7Tz9Rg2Mc1Rkuw6oKvDbNF1HeB4buIVGLOwK
	 OK6uC2F/9ahtlIHyz485WYh9h30/uBh2DR1cyH4TRTR35oUMfiQP+WoiyCVWONVY3v
	 kIeYWOqOuX9Apyk+h/6dKJlSiwrfIlAXsYHMUGFjPtGMlo9L68yG6TNzc80cFof5gZ
	 gf3jo51bQR6nULYc+L6PRvc9JGF7z8Tpj90ivj7aSevQ8QJIDuNe9//3j/pWfw50wd
	 0pJZTac5hmzAQ==
Date: Tue, 9 Jan 2024 08:42:52 +0000
From: Lee Jones <lee@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Pavel Machek <pavel@ucw.cz>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 REBASED] dt-bindings: leds: add "usbport" trigger
Message-ID: <20240109084252.GF7948@google.com>
References: <20230316135546.9162-1-zajec5@gmail.com>
 <20230316153310.GI9667@google.com>
 <9fe9cf5b-c215-4538-b726-abe61ea01e4a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fe9cf5b-c215-4538-b726-abe61ea01e4a@gmail.com>

On Thu, 28 Dec 2023, Rafał Miłecki wrote:

> Hi Lee,
> 
> On 16.03.2023 16:33, Lee Jones wrote:
> > On Thu, 16 Mar 2023, Rafał Miłecki wrote:
> > 
> > > From: Rafał Miłecki <rafal@milecki.pl>
> > > 
> > > Linux's "usbport" trigger is a bit specific one. It allows LED to follow
> > > state of multiple USB ports which have to be selected additionally
> > > (there isn't a single trigger for each port).
> > > 
> > > Default list of USB ports to monitor can be specified using
> > > "trigger-sources" DT property. Theoretically it should be possible for
> > > Linux to deduce applicable trigger based on the references nodes in the
> > > "trigger-sources". It hasn't been implemented however (probably due to
> > > laziness).
> > > 
> > > Milk spilled - we already have DT files specifying "usbport" manually -
> > > allow that value in the binding. This fixes validation of in-kernel and
> > > external DT files.
> > > 
> > > Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> > > ---
> > >   Documentation/devicetree/bindings/leds/common.yaml | 2 ++
> > >   1 file changed, 2 insertions(+)
> > 
> > Applied, thanks
> 
> it seems this PATCH got lost somewhere. Can you check it, please?

What makes you think that?

https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/leds/common.yaml#L126

-- 
Lee Jones [李琼斯]

