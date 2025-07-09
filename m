Return-Path: <linux-leds+bounces-5015-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EADAAFE235
	for <lists+linux-leds@lfdr.de>; Wed,  9 Jul 2025 10:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5D7B5816F2
	for <lists+linux-leds@lfdr.de>; Wed,  9 Jul 2025 08:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0F723AB86;
	Wed,  9 Jul 2025 08:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzGydbfK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A67123A9A0;
	Wed,  9 Jul 2025 08:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752048748; cv=none; b=UO/+/EhACls4UvMIxJqYNMqYFqeTDIdC420KI2P6oEl8Ma7KBz8k36Qgrg2hogOURbEpvDms25sH/t2AUQJqNbg3+VJpa0U37vlekbXHwcqROU2MhXbXerk53pUFz379XXgoxipDpIm6vwpntobRhrjz9hfQ3c93Gfb+vIvfnEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752048748; c=relaxed/simple;
	bh=ngXTyPOrFDtMhkNfxPlPJoLsb2coWp4eTnYpgLCyzes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nn6dZr7/hDCCcb4jn3J6llLTqsbt7gf4CWYhBacqfMdscsn1odhST8tHPQqf214ExMoQ4TqeksxHH0S+Y9cyaMOQLzxWxh7gzpdGMZHnvWVop5io/S/s1iPIl+XRjRrcaA2xsRq48fKWzVLP0L11H08G8zOAWoPMhdsR9WBIizo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzGydbfK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACF1C4CEF0;
	Wed,  9 Jul 2025 08:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752048748;
	bh=ngXTyPOrFDtMhkNfxPlPJoLsb2coWp4eTnYpgLCyzes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EzGydbfK2RByqOHnjsHQOFrdR4HUOinbMkGl2ZuRfqCjQv2IBAbj6s6vftbDDIoQT
	 O9QoQFtmdlCqsvNV7Wg24Mk3MkSgegKInxSjCpE2dwEJWcUiWxMDc8/KqWVQkpADZ6
	 W/11XzHwOB17tEwXgoEkxgRFeoSGiftSfLD98JpzeaFUMT6z8soSyGifLQguvVqQCr
	 QxBEBRZRsk4quwyWgVGwFTuepYu3GCuRkoG9JOd4t+6GzgjzBcyio64wMcQU641gea
	 Rf08wnqW3y9JJjA4AUV5sVYYTNJOjFTg/mL/Uxo9fH6JfN+xcdHx/Yx5WrSWy6FS5J
	 QI+M2MCRUZofg==
Date: Wed, 9 Jul 2025 10:12:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] leds/leds-is31fl32xx: add support for is31fl3236a
Message-ID: <20250709-primitive-offbeat-toad-08930d@krzk-bin>
References: <20250708-leds-is31fl3236a-v3-0-d68979b042dd@thegoodpenguin.co.uk>
 <20250708-leds-is31fl3236a-v3-1-d68979b042dd@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708-leds-is31fl3236a-v3-1-d68979b042dd@thegoodpenguin.co.uk>

On Tue, Jul 08, 2025 at 03:59:45PM +0100, Pawel Zalewski wrote:
> +
>  	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
>  		struct led_init_data init_data = {};
>  		struct is31fl32xx_led_data *led_data =
> @@ -405,6 +438,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
>  
>  static const struct of_device_id of_is31fl32xx_match[] = {
>  	{ .compatible = "issi,is31fl3236", .data = &is31fl3236_cdef, },
> +	{ .compatible = "issi,is31fl3236a", .data = &is31fl3236a_cdef, },

Bindings go before the users (see submitting patches in DT).

Best regards,
Krzysztof


