Return-Path: <linux-leds+bounces-3490-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB489E55A1
	for <lists+linux-leds@lfdr.de>; Thu,  5 Dec 2024 13:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96B681881512
	for <lists+linux-leds@lfdr.de>; Thu,  5 Dec 2024 12:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349AD217715;
	Thu,  5 Dec 2024 12:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loveLPSy"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081F91FBC9E;
	Thu,  5 Dec 2024 12:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733402297; cv=none; b=aXwhm4HVg/VpUJBhBeJ89wtDRYgzvPbfQWx/v7OtFw9ltaTJlRaBFoSh3ngMVUif7+Y5wFL0TSo4bJUvf1oGmIrF6l56gRbhSUQyANrAgrY+DvQjS+XAf33FZH/ulK7CMO72n2jIvkaSURFjjn5lEjd4cSsopIU69U9C1o7N4qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733402297; c=relaxed/simple;
	bh=wru6jEXYguOVUgFVxyj97+th84798Q33oYJV3EJ0Ex0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jn6lW/2zmINo/ni1fVClHrqUPk8Z353GCSdGbI5BN7wuWhtf9BJQju9Ux07z1WR1xAIUe5xV10aMnjgNx9lt0rshTSYemcKhOrp8YOtG2vTeenkA4PljutdmuJ1Y+H75sslUgPZl9fm+yn9Otw30yLtSi/xHQhvIFmyj4DsVik4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loveLPSy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBADC4CED1;
	Thu,  5 Dec 2024 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733402296;
	bh=wru6jEXYguOVUgFVxyj97+th84798Q33oYJV3EJ0Ex0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=loveLPSyuQpVDCyHn0O2tcuxbHaYZ6+Hl1uXY862sDhXoEsc50WudvAzRBPfdzyWu
	 6N7slBoJPsel5WcE4tN1TNerGRTuYQQ3d3B5PwdF+GhddpMmAjhQUgPCatNXd583Y4
	 Kz8x90kFG9jQQUQpqx0ZM/JE2N2aHXJu9fOR9LQThBPlRXVHCqgU/m3rM+F1VAkTOq
	 JBDe1e/OEvDZxNou+zzGgFERXRkthvWuM3qtobOr1ehHnCOdTNg2YbnCGZcjhH/PBR
	 mULnfm7iac4Evq43OcpKd23QuOFQ7eSabi7m09MGsYAmSTMFfZ2JuKDYg12WU+csiD
	 7cOz6AtZhq+1w==
Date: Thu, 5 Dec 2024 13:38:10 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Lee Jones <lee@kernel.org>, regressions@lists.linux.dev, 
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
Message-ID: <2iocrd4a7l4avfhqmobbexo7k4u2poidkvvj7lpqh7vp7mprkm@pfgytqnmt2si>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-13-kabel@kernel.org>
 <87bjyv9ecb.fsf@BLaptop.bootlin.com>
 <778f08f1774fcad5fcc39114dbb721793ebf95d6.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <778f08f1774fcad5fcc39114dbb721793ebf95d6.camel@gmail.com>

On Wed, Dec 04, 2024 at 07:48:51AM +0100, Klaus Kudielka wrote:
> On Mon, 2024-11-04 at 17:02 +0100, Gregory CLEMENT wrote:
> > Marek Behún <kabel@kernel.org> writes:
> > 
> > > When global LED brightness is changed by pressing the front button on
> > > Turris Omnia, the MCU can produce an interrupt to the CPU. Add the
> > > description of this interrupt to the LED controller node.
> > > 
> > > Signed-off-by: Marek Behún <kabel@kernel.org>
> > 
> > As the binding had been acked, and this change won't produce any
> > regression I can already get it.
> > 
> > Applied on mvebu/dt
> > 
> > Thanks,
> > 
> > Gregory
> > 
> 
> This patch made it into v6.13-rc1, and completely breaks the LEDS on my Turris Omnia CZNIC11.
> The entries in /sys/class/leds disappeared, and instead the kernel says:
> 
> [   11.746116] i2c 1-002b: deferred probe pending: (reason unknown)
> 
> If I just revert the patch on top of v6.13-rc1, all is good again. Kernel config attached, for reference.
> 
> Best regards, Klaus
> 
> #regzbot introduced: 68bc6a71f56875a7dbde4f44aa4404c214651e1c

This is because the patch went into 6.13 but the rest of the patches
did not, Lee wants to take them for 6.14 :-(

Apply this series and it will work.

https://lore.kernel.org/linux-leds/20241111100355.6978-1-kabel@kernel.org/T/

Marek

