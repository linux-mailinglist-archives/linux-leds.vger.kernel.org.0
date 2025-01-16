Return-Path: <linux-leds+bounces-3779-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DC4A13AF1
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jan 2025 14:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE6D93A7A6B
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jan 2025 13:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF063273FD;
	Thu, 16 Jan 2025 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="EePHM/w+"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2864502B;
	Thu, 16 Jan 2025 13:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737034343; cv=none; b=Uy/DM/tvE/FcEoqTNtFijCG5JV3uQksa6YSz9sZMk7vKlW6yXmGynN5qUGmNJ/9demZ0dZFOEiP7H/nnNp8pt5bIN+5CKJOtLLDFdMsD3lYmPJPKf4X4VF3ZEMmr2TkfFbntZGHPV1lotcDz1QcN14WQZryG1VkFOH01jziwFbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737034343; c=relaxed/simple;
	bh=M5X3iDM5NgKQ2nmYgYKdGhXHXe6i/ZmrMdApB8avarI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eee8FDuuyfGVndQEmr1E0rIFIUIfEsXSmT6xJMqh16xZxfZ6iaD5ZSskHjQtAkjguoL8Jb54ATK17TRwa0EhLgk8UE8ukkYQrN7kcBuRtzrCX+hWJi2NlXYn2R1gkjMKJ60YLPfZdeJO/V3RmeqI/GaptwCXPkhWAadfbyXXk6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=EePHM/w+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=90g3gIauqqHNl5f8G2J1kYxD7yYWLujN1i0hg8K2Lgs=; b=EePHM/w+shQbbldkFjXAtn1o9T
	NzoHLtXgDYuBcoe+AfZWINiQoDSDQoZl6EGJQJcYGD77mohBeQilM+WW1Wm8FufyYQd5Yiy8GmHPl
	NLjCaIOpKENkrgc0CWktBPcGW7c0KCbSphE+Sn9p9A7KuDF5oKoBwFdtQYK8iHkket/U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tYPyn-0058P5-Bx; Thu, 16 Jan 2025 14:32:13 +0100
Date: Thu, 16 Jan 2025 14:32:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marex@denx.de>
Cc: linux-leds@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, Lukasz Majewski <lukma@denx.de>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: Document netdev trigger
 netdev-trigger-mode property
Message-ID: <ad334b1b-a4e5-426d-a801-3e1d72455304@lunn.ch>
References: <20250113002346.297481-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113002346.297481-1-marex@denx.de>

On Mon, Jan 13, 2025 at 01:23:37AM +0100, Marek Vasut wrote:
> Document netdev trigger specific netdev-trigger-mode property which
> is used to configure the netdev trigger mode flags. Those mode flags
> define events on which the LED acts upon when the hardware offload is
> enabled. This is traditionally configured via sysfs, but that depends
> on udev rules which are available either too late or never in case of
> non-Linux systems.
> 
> For each LED with linux,default-trigger = "netdev" described in DT, this
> optional netdev-trigger-mode property supplies the default configuration
> of the PHY LED mode via DT. This property should be set to a subset of
> TRIGGER_NETDEV_* flags.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Christian Marangi <ansuelsmth@gmail.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Heiner Kallweit <hkallweit1@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Lukasz Majewski <lukma@denx.de>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index 3e8319e443392..1f1148fdf20c0 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -233,6 +233,12 @@ properties:
>        Maximum timeout in microseconds after which the flash LED is turned off.
>        Required for flash LED nodes with configurable timeout.
>  
> +  # Requires netdev trigger
> +  netdev-trigger-mode:
> +    description:
> +      The netdev LED trigger default mode flags, use TRIGGER_NETDEV_ * flags.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
>  allOf:
>    - if:
>        required:
> -- 

An example would be good.

In order to be able to use TRIGGER_NETDEV_* i assume you are doing an
include which is outside of the usual dt-bindings directory. I don't
know of the DT Maintainers opinion on that.

	Andrew

