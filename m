Return-Path: <linux-leds+bounces-2737-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCF497A436
	for <lists+linux-leds@lfdr.de>; Mon, 16 Sep 2024 16:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEDA628E360
	for <lists+linux-leds@lfdr.de>; Mon, 16 Sep 2024 14:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A2D156C73;
	Mon, 16 Sep 2024 14:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHTXLGmw"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED12F154C14;
	Mon, 16 Sep 2024 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726497197; cv=none; b=ZHWTBwJ4qwR3w72A2MnIcHPNFqEnnpECWw+I3UiotT1tVVK8foQVOmz4mVmZGu4D9jQ6dhf0N+IrzMXTa1tHJkONlG0/nGw6gknmn5hlsyy19VOU0iO+wXH6JvmtNtPS8LCkGd9DqPgRQETr55jlifiYsK7tdVkNKUXEez6Uk+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726497197; c=relaxed/simple;
	bh=Z/CvUXkaSdf/EtGRsR+rg0pbyNHYk1lP5H8wfJohrCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMxFodudj3jPr0yRM0WzALEAgoBPworbHfWesEGpmdC8sOww39KxLWTOmLYVq2VnQhapUbv8+OS3B+JO86WGNb21D92lUa7Sd+3IsnwTgUEiYaauQnmC48rm8CRoWehfy7+38xAzIXBTa2dUD7rlkDpEWpS2Q7LAMmNMgcHAzso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHTXLGmw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D35C4CEC4;
	Mon, 16 Sep 2024 14:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726497196;
	bh=Z/CvUXkaSdf/EtGRsR+rg0pbyNHYk1lP5H8wfJohrCk=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=RHTXLGmwdBWmuGb1YCSXlEJ6JJXRy/aEN74KjHz655i3E4ib/JztMDMuelv4m/fxh
	 7yZs2ijP1K40DcUcVQvAxZj7vouCPpyjrQGsuUzFD7aqM2OuLpm+seZHIobCKx+cbe
	 Ox9XZvDpzxojPEY4eHzYxo2oOorxaPmD1rWbOXOyTOpoFdK1a3pfoFBkPvPo/e24B4
	 wfCKzHazw7j+AWiwDU9+RyCIbHBjrysLRBWVwCz8xE/Wix4mcraIy5dfcm9I1TglrN
	 5+5zMHfY8ErDkz2e0KwSWQw4eeB6NAg+gRfD6TYDSmy2xR95i9S4TNlFy1EwVTSx7e
	 mxgypYXzaL8+w==
Date: Mon, 16 Sep 2024 16:33:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v3 05/11] dt-bindings: leds:
 cznic,turris-omnia-leds: Allow interrupts property
Message-ID: <rchpwlmgzsoj37oz6plzqcyxdyzpcdqtpmzik2gcflakeca3rm@vcdrovzs4nzh>
References: <20240913123103.21226-1-kabel@kernel.org>
 <20240913123103.21226-6-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240913123103.21226-6-kabel@kernel.org>

On Fri, Sep 13, 2024 at 02:30:57PM +0200, Marek Beh=C3=BAn wrote:
> Extend the cznic,turris-omnia-leds binding with interrupts property,
> specifying the global LED brightness changed by button press interrupt.
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---
>  .../devicetree/bindings/leds/cznic,turris-omnia-leds.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-le=
ds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.ya=
ml
> index 34ef5215c150..f52f6304c79e 100644
> --- a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> +++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> @@ -23,6 +23,12 @@ properties:
>      description: I2C slave address of the microcontroller.
>      maxItems: 1
> =20
> +  interrupts:
> +    description:
> +      Specifier for the global LED brightness changed by front button pr=
ess
> +      interrupt.

This "front button press" concerns me that you just hooked here
gpio-key. Are you sure that this is the physical interrupt line going to
this device?

Best regards,
Krzysztof


