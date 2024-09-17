Return-Path: <linux-leds+bounces-2744-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA6297ABD2
	for <lists+linux-leds@lfdr.de>; Tue, 17 Sep 2024 09:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5FAC1C217C5
	for <lists+linux-leds@lfdr.de>; Tue, 17 Sep 2024 07:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF1D14BFBF;
	Tue, 17 Sep 2024 07:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ly3yQwKS"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1272714B948;
	Tue, 17 Sep 2024 07:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726556906; cv=none; b=dP6vj7HPXYWnu3ZMVpYwpJS5j/EsG+PJFK7/ldKeBXedUV/nYKwQ4A4K425wFZqjxEVixd9jM6iFo4YqUYsf8F9kEeBG+vmdK69vlPMWSubBaRu1jeXOUnxSxw/StUStd3uixCK0U5aklAjIJnI/5PP5DUfzvlp8f31ceuGqk5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726556906; c=relaxed/simple;
	bh=CtLX31xBKl7pTBviyO7QkqtzLTLLKRQCAQc0l5Biwe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vl7hNtLi9PVfAcNiX5iMCMUZNc/YaM+oungTD+cbMZKW6gxbvvnLefVlixBEQL+zG9vpqZwYh7bWOqZXED/fmiRT5EcaOC93sDGLEVon9LSKik7sx9joVf43s2e/mj6FWxe5h/KH8UzurmEFkaMj9734glJQclgxmza/KEIYEc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ly3yQwKS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545C9C4CEC7;
	Tue, 17 Sep 2024 07:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726556905;
	bh=CtLX31xBKl7pTBviyO7QkqtzLTLLKRQCAQc0l5Biwe4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=ly3yQwKS8/GQz3n9+dUoxaEjMwuaYdOdA/Y3+rjhDCcVAob/XSTaQI8qc2FBN86z+
	 IJbDhzy1A6XT+7GV1AsZrTllIGx08L0F3tQwc+2Ofg4ps45rd4bjiiqz+5zsyyOsZV
	 rbJbJr26IErc2wYiobRt4wBHP2KYevUydLN4XN+A/5aOGe9dtkceUpKE1I/RPFDAO1
	 Pbfj9NqyzxjQwv1VhZKLnd5ENEvzky2a8Cs1xcoJdI3AHs6sAqdINQE8THZ8q3GJlf
	 0Mm8FqYukT5tAXq98cOJjPLmTCi8d+YZbwLHYfWpJgkyLm2AP2t+Kbb2OdykWH5rjh
	 jiCAKCIi81+pA==
Date: Tue, 17 Sep 2024 09:08:19 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v3 05/11] dt-bindings: leds:
 cznic,turris-omnia-leds: Allow interrupts property
Message-ID: <wn6mj233oqouxbrbogpf27w5bdybukoblbold6gk25fdfmy5j2@dlzxkh7whlzw>
References: <20240913123103.21226-1-kabel@kernel.org>
 <20240913123103.21226-6-kabel@kernel.org>
 <rchpwlmgzsoj37oz6plzqcyxdyzpcdqtpmzik2gcflakeca3rm@vcdrovzs4nzh>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rchpwlmgzsoj37oz6plzqcyxdyzpcdqtpmzik2gcflakeca3rm@vcdrovzs4nzh>

On Mon, Sep 16, 2024 at 04:33:13PM +0200, Krzysztof Kozlowski wrote:
> On Fri, Sep 13, 2024 at 02:30:57PM +0200, Marek Behún wrote:
> > Extend the cznic,turris-omnia-leds binding with interrupts property,
> > specifying the global LED brightness changed by button press interrupt.
> > 
> > Signed-off-by: Marek Behún <kabel@kernel.org>
> > ---
> >  .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> > index 34ef5215c150..f52f6304c79e 100644
> > --- a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> > +++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> > @@ -23,6 +23,12 @@ properties:
> >      description: I2C slave address of the microcontroller.
> >      maxItems: 1
> >  
> > +  interrupts:
> > +    description:
> > +      Specifier for the global LED brightness changed by front button press
> > +      interrupt.
> 
> This "front button press" concerns me that you just hooked here
> gpio-key. Are you sure that this is the physical interrupt line going to
> this device?

No no no, that is a different interrupt from the gpio-key.

The button can be configure in two modes:

- it can act like a GPIO to the CPU, forwarding press and release events
  via the GPIO chip (so button press it is handled by CPU)
  - can be set with
      echo cpu >/sys/bus/i2c/devices/1-002a/front_button_mode
  - pressing it will generate the INT_BUTTON_PRESSED interrupt from the
    MCU

- it can change LED panel brightness (so button press is handled by MCU)
  - this is the default mode, configured after boot
  - can be set with
      echo mcu >/sys/bus/i2c/devices/1-002a/front_button_mode
  - pressing it will generate the INT_BRIGHTNESS_CHANGED interrupt

The INT_BUTTON_PRESSED and INT_BRIGHTNESS_CHANGED interrupt semantically
different (and also literally, they are at different bits). See
  https://gitlab.nic.cz/turris/hw/omnia_hw_ctrl/-/blob/master/src/drivers/i2c_iface.h?ref_type=heads#L289-L321

Marek

