Return-Path: <linux-leds+bounces-3491-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A2D9E55BC
	for <lists+linux-leds@lfdr.de>; Thu,  5 Dec 2024 13:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76FC81882A79
	for <lists+linux-leds@lfdr.de>; Thu,  5 Dec 2024 12:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C143421885E;
	Thu,  5 Dec 2024 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOA0mi7h"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935531EB2F;
	Thu,  5 Dec 2024 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733402582; cv=none; b=pMUZaYHxk02KVSig9VR7ss41rL8VJ62fXXPTSh84MaDuFgaS5mG1XtWooi7s6cnEUjWJFrVtEPKq4eWScCKxDsz9UrouM047BDTYUzt2ZWROIdhEOR5mfwSg7p8dxL+T6v+/oicwZL7tsXt/ODuORIImzw5wx7SGr5qouNjQ+pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733402582; c=relaxed/simple;
	bh=c3AR7VNa7Axc5m38pbb3JDhLhtCHLJu8X5574bwf74g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNNjwZvB6UiIYAfo3xOxABY+0fHvII0nJrR7sgy4mB27fje1UMjD12K1/wSl7vumxx8vtxtsA38GT/wBCgNWJXMjc5VWmaIEKQVErw26Pd5IdAVE7nftvj+Nx913TBUQgNr7aF+SRMucegYO5rYF0cSovIVvJMbkhmACZtbOfuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOA0mi7h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32814C4CED1;
	Thu,  5 Dec 2024 12:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733402582;
	bh=c3AR7VNa7Axc5m38pbb3JDhLhtCHLJu8X5574bwf74g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOA0mi7hywXG0d1/uUAbtg3DcTJlVSax9QJsdZgt0ieX6jlMsrD3Kkp7t7JyfgnWa
	 gX36OYbKePx/iZOVpgctI6S+Tgcn+hEVOFPo+Jxq5qO48sHCerU4K3347ptbycxrE5
	 E12W+zUXlvveSzct/HkIePaI9Po744epVRKlRAWCIu2bVCl+UuttGWHgXVFl7YY9Wr
	 tzyWjs96JtblLskq9yKUhn4+C6uCrutDN83OhIaAGZIyi27+/gU73M0Z1BSvvYezl0
	 znAbvVwImgmYgk4puLJgsz6CJ6m7TxLXTR5V8A023xdK7cK4JbNYEH6Z8k1nrFDrr9
	 a9OpeN9bjGh/g==
Date: Thu, 5 Dec 2024 13:42:55 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: Klaus Kudielka <klaus.kudielka@gmail.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, Lee Jones <lee@kernel.org>, regressions@lists.linux.dev, 
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
Message-ID: <ofd5ru77wypfysflpblafbbdgrcmzztqwoewfjfuusrnbma4aw@y3oc3etutisi>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-13-kabel@kernel.org>
 <87bjyv9ecb.fsf@BLaptop.bootlin.com>
 <778f08f1774fcad5fcc39114dbb721793ebf95d6.camel@gmail.com>
 <2iocrd4a7l4avfhqmobbexo7k4u2poidkvvj7lpqh7vp7mprkm@pfgytqnmt2si>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2iocrd4a7l4avfhqmobbexo7k4u2poidkvvj7lpqh7vp7mprkm@pfgytqnmt2si>

On Thu, Dec 05, 2024 at 01:38:10PM +0100, Marek Behún wrote:
> On Wed, Dec 04, 2024 at 07:48:51AM +0100, Klaus Kudielka wrote:
> > On Mon, 2024-11-04 at 17:02 +0100, Gregory CLEMENT wrote:
> > > Marek Behún <kabel@kernel.org> writes:
> > > 
> > > > When global LED brightness is changed by pressing the front button on
> > > > Turris Omnia, the MCU can produce an interrupt to the CPU. Add the
> > > > description of this interrupt to the LED controller node.
> > > > 
> > > > Signed-off-by: Marek Behún <kabel@kernel.org>
> > > 
> > > As the binding had been acked, and this change won't produce any
> > > regression I can already get it.
> > > 
> > > Applied on mvebu/dt
> > > 
> > > Thanks,
> > > 
> > > Gregory
> > > 
> > 
> > This patch made it into v6.13-rc1, and completely breaks the LEDS on my Turris Omnia CZNIC11.
> > The entries in /sys/class/leds disappeared, and instead the kernel says:
> > 
> > [   11.746116] i2c 1-002b: deferred probe pending: (reason unknown)
> > 
> > If I just revert the patch on top of v6.13-rc1, all is good again. Kernel config attached, for reference.
> > 
> > Best regards, Klaus
> > 
> > #regzbot introduced: 68bc6a71f56875a7dbde4f44aa4404c214651e1c
> 
> This is because the patch went into 6.13 but the rest of the patches
> did not, Lee wants to take them for 6.14 :-(
> 
> Apply this series and it will work.
> 
> https://lore.kernel.org/linux-leds/20241111100355.6978-1-kabel@kernel.org/T/

Alternatively you can overcome this issue if you enable the
turris-omnia-mcu driver in 6.13:

  CONFIG_CZNIC_PLATFORMS=y
  CONFIG_TURRIS_OMNIA_MCU=y/m
(and also the subsequent options).

Marek

