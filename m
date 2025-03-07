Return-Path: <linux-leds+bounces-4190-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8064FA562CE
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 09:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 768333A7D61
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 08:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F421DE2CC;
	Fri,  7 Mar 2025 08:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZXQvE9m"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A0B1AA7BA;
	Fri,  7 Mar 2025 08:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741336978; cv=none; b=WBNGr3FT+mE05Nr0lC9QAlXa+kenVpZpS/ROPElWc1g1s3J4r5dHRqFGSkqKTr8wCEIXLlFJYBh6Lo+7vXSZ75d7RI8jCA0DvsI4RurtIUW3uZgNklv12CmqzfPwE5zlCfDrHO1PN2+FXQwauZ+Q4YQq/OCoUJi8wP97EmZ0p3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741336978; c=relaxed/simple;
	bh=cjHL1BfpdlUKdCE13R8J2iBPrj0G2e7XUcnnLi0SofM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBoNhmrAZkY86M6s1U+IenaJ0MwVZl3bCWWttMXPrg6RywOPBOdZUhKnTSw2BXP4vYdOkMVvP7eH7B2QtWJkGbKnJPMNth/O2wU+WXCkdhG3b7/KKj0qVWmkR7Ydr2qoB0pAuJ7/BYEIxsA/oNlOUjLw+HOWjHuei7/i5bcXwac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZXQvE9m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10113C4CEE5;
	Fri,  7 Mar 2025 08:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741336978;
	bh=cjHL1BfpdlUKdCE13R8J2iBPrj0G2e7XUcnnLi0SofM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZXQvE9mNzft+6w0Ikl2OSNE0a0ta9ZkPmFtk5V3SvDraSOjVP/ZVF+7WlPsD0yrY
	 Jp3ENzlhuqebbeNkPS6FHiiPXfjbA9NMXoV2Z6O5zX/r7hjoClja9wVAddrEFsc2V+
	 ylD52RO+iwJTgyrtr92QUypFR9yCA1bPv4l1xQ7as5ZtJAcVorwOALmQE90AjB4cnM
	 S67kgpD0UAY8Ux9Y+Iflc+j8hNP+SJMPSmbFLksp2eI+LJxIQFmWgAasDkj1KuUDkf
	 5U1zvwZulNaX0dtTpkj1KeYZ54KNXPGA396MUP2FASMzYthqSVyW3P8fbymhrzN5gK
	 emW4wM6JQavlQ==
Date: Fri, 7 Mar 2025 09:42:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, lee@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: Add LP5812 LED node for Raspberry Pi
 4 Model B
Message-ID: <20250307-hysterical-strong-penguin-75583f@krzk-bin>
References: <20250306172126.24667-1-trannamatk@gmail.com>
 <20250306172126.24667-3-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250306172126.24667-3-trannamatk@gmail.com>

On Fri, Mar 07, 2025 at 12:21:25AM +0700, Nam Tran wrote:
> Add the LP5812 LED driver node to the Device Tree for Raspberry Pi 4 B.
> This enables the LED connected to the LP5812 to be controlled via I2C.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> index 353bb50ce542..85441746d94b 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
> @@ -270,3 +270,13 @@ &vec {
>  &wifi_pwrseq {
>  	reset-gpios = <&expgpio 1 GPIO_ACTIVE_LOW>;
>  };
> +
> +&i2c1 {

Follow ordering of nodes explained in DTS coding style.

Best regards,
Krzysztof


