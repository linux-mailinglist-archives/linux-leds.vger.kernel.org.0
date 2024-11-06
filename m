Return-Path: <linux-leds+bounces-3313-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 732759BE521
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 12:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99ABCB21065
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 11:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247721DE3B3;
	Wed,  6 Nov 2024 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQ7Ambg+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F126C1DB377;
	Wed,  6 Nov 2024 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730890960; cv=none; b=NVq7GrcM/QaVUpCo5momkHM1ECCJvcmGHyXrG9SC5Alg5RXBU75+Z5VUXcM1rdchnxhq+rdmwUISrhTZX9bX6udKsqvsPy8tqsIcpG2CJSLvRQL2raJHza4jfrxJdrmShYCOzT4R1moLDktYMnYwU8ldxO/vkLxNCVaQ30dd3Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730890960; c=relaxed/simple;
	bh=rM3Znp+GbgDWwm/IItLJq0dXgzZUYcCDCUKLpzWVFlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kixH+ABX6vKO+wmn9tHuQpGB07WbPzLfh0YBSZE/6yf8xgoqPefil6actJuv3LYjlS0IDHeDslk2qPjyOasnCD26vorxDmX7qo0ToRrqL7rzKsVdw0g/ZF04ZBWXS1G2R+6Rr1aYIhcqwa6r4nYVMXf4Q1yZD/O9beYmbavf5/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQ7Ambg+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F285C4CECD;
	Wed,  6 Nov 2024 11:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730890959;
	bh=rM3Znp+GbgDWwm/IItLJq0dXgzZUYcCDCUKLpzWVFlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQ7Ambg+XEThepG3HsQKItleVudRNcrWMuVLDlszbbKN33d4S9aQ8O5eC/LvxKMK/
	 LxoxaVLH9wACBI42lnHOW2tQZfpI4JJvGLIdGMQUjH/bRXAK/3SAgBm1L3cA9YdWjm
	 WsQ89v/SXeokMK2+Rv+lRCn8MGznsxHYMrEPNugMVWxj2jiYUqCTJHzZqQ9KzHBsoi
	 oWLqZ/JoIspWgukt0hX6kg8Aj+ujecZp2VBmTwRyKhQHVyHIglSCqZzyLpt13C/Jxw
	 +SJTWJppbOdeOgVlvprevgJmy56pj3+lkijykw2zMZsNhUQ2pLybIl/LzdNdMzzyg3
	 9ktrsll9q3jgg==
Date: Wed, 6 Nov 2024 11:02:33 +0000
From: Lee Jones <lee@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 01/12] turris-omnia-mcu-interface.h: Move command
 execution function to global header
Message-ID: <20241106110233.GT1807686@google.com>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-2-kabel@kernel.org>
 <20241106102840.GN1807686@google.com>
 <87msic8wh7.fsf@BLaptop.bootlin.com>
 <20241106110156.GS1807686@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106110156.GS1807686@google.com>

On Wed, 06 Nov 2024, Lee Jones wrote:

> On Wed, 06 Nov 2024, Gregory CLEMENT wrote:
> 
> > Lee Jones <lee@kernel.org> writes:
> > 
> > > On Mon, 04 Nov 2024, Marek Behún wrote:
> > >
> > >> Move the command execution functions from the turris-omnia-mcu platform
> > >> driver private header to the global turris-omnia-mcu-interface.h header,
> > >> so that they can be used by the LED driver.
> > >> 
> > >> Signed-off-by: Marek Behún <kabel@kernel.org>
> > >> ---
> > >>  .../platform/cznic/turris-omnia-mcu-base.c    |   1 +
> > >>  drivers/platform/cznic/turris-omnia-mcu.h     | 130 -----------------
> > >>  include/linux/turris-omnia-mcu-interface.h    | 136 +++++++++++++++++-
> > >>  3 files changed, 136 insertions(+), 131 deletions(-)
> > >
> > > Who needs to Ack this for me to take it via the LED tree?
> > 
> > Usually, it's Arnd who takes these patches, so it could be him who needs
> > to acknowledge them. However, Marek is the maintainer of this driver, so
> > I think it's already okay for you to take it.
> 
> Okay, let's leave it for a little while.
> 
> If Arnd does not protest, I'll take it in for v6.14.

... after my review comments have been processed of course.

-- 
Lee Jones [李琼斯]

