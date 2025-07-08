Return-Path: <linux-leds+bounces-5013-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F310BAFD4C5
	for <lists+linux-leds@lfdr.de>; Tue,  8 Jul 2025 19:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 689F71890DC3
	for <lists+linux-leds@lfdr.de>; Tue,  8 Jul 2025 17:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719522DC34C;
	Tue,  8 Jul 2025 17:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjgtPNwf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480B5202F70;
	Tue,  8 Jul 2025 17:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751994368; cv=none; b=JhmgAaenekab4IcuYodGCP71qPIC8rsIrAsxmbtaecUp/phWVGwi9m5FofsMLyZQgG1p08KXcTItmofB8L3dq5fG5ispgyjpamkxgDeJN6zhviIkkgquCxIYnMwczdgwl9b98fknC8639JQu+7Nc/PpyNcBnY0mXEb20JizLkJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751994368; c=relaxed/simple;
	bh=1svJo+xPXVmx/MsVPlxucUYtpNb5vbrgISfk+bp8bwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nie8KiB4HaQ+8xPJXaawiqVJt+m9orj8sVdIYx3v43bETtrgwkbgpsuRSBR4xZ4Z5mCvOzLfTk3xWGyVwNgyGGrenpAxK5c0yfZqb2ucusYosyQUV5aD/4Cg/wW+7rN0RDLtk5cDWwhj3RT6aqLNe1RQG6johWqkVB//Bx/aWZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjgtPNwf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5B4C4CEED;
	Tue,  8 Jul 2025 17:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751994367;
	bh=1svJo+xPXVmx/MsVPlxucUYtpNb5vbrgISfk+bp8bwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bjgtPNwf1cwNP3/5gGgnqkTbZBPdDgbpmwSscp9+sO7UcmpnVlZomEI2Stnh9Sjvg
	 m2xmvQ/7whVVeK6GxgVoNNrSVrRyDnWZ0coHxLxwSne+wp4L0lYKBx5dDrP/+ferfM
	 8vgFjAcMMdvupzJ8FXM0YDUIrbaT+bnzM/zpdja1n7MAIOP2dBnLEE3CZn2HJ/oxLf
	 pxm/c05vcS8H3yellF8TiTLMYQaii9i/ydaEHMb/5WLJ95zYnSDCzS9I5fooCg5R4S
	 lUgy4BjpPonNm/qThsn8N97nSWLBCk4gK6ed5F2T9Qb0Efv/ylpOWzRXRMcyM3Z0Q0
	 bPJxht1+i2xoQ==
Date: Tue, 8 Jul 2025 12:06:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: lee@kernel.org, krzk+dt@kernel.org, pavel@kernel.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	alkuor@gmail.com, conor+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: leds: ncp5623: Add 0x39 as a valid I2C
 address
Message-ID: <175199436580.636302.13969412271190121000.robh@kernel.org>
References: <20250703144644.2878253-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703144644.2878253-1-festevam@gmail.com>


On Thu, 03 Jul 2025 11:46:44 -0300, Fabio Estevam wrote:
> The NCP5623C variant has the I2C address at 0x39 according its datasheet:
> 
> https://www.mouser.com/datasheet/2/308/NCP5623C-D-64591.pdf
> 
> Make 0x39 a valid I2C address in the dt-binding.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  Documentation/devicetree/bindings/leds/onnn,ncp5623.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


