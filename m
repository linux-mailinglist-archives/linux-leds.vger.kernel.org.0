Return-Path: <linux-leds+bounces-3678-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E49C99F77A6
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2024 09:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBC1A16F570
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2024 08:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812282206A5;
	Thu, 19 Dec 2024 08:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gbtJRnnB"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7D7219A76;
	Thu, 19 Dec 2024 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734597753; cv=none; b=VqdcYNdrtE2h4P0WZDSheujKBxY5KDXDgCfjJzO/IP2BLmDeO5Nm0hyx5Clk5ZoqM+FdqkwerHm+UzExCbm+2HwKg8HgBD33LKBCecVkPBJZPiQkjWE9gTnGMMm6zRhisSLuIpZerQipEXLKGWj+CWfR6ANRkb1PnM9Qs2FzVV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734597753; c=relaxed/simple;
	bh=Bvfub3Os8feZUY3FdzD/XMdpBI3OuM/ofBOb8POapSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/t0/qeoabX+MQAAu7tYz3yUbl+UYVYCdMadQqIxM+UjD88GVRYV2/Y//yTSfmdgGYcaggNU5emEZDvQrlfR1HuEgbSc+SlasgeVGJVfaEiKWbXz35EoTUZZqqJhIfQvG185lEpVxxXO7VqXDnicATvq4IlO8qeDpvFh5rHADec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gbtJRnnB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F422C4CECE;
	Thu, 19 Dec 2024 08:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734597752;
	bh=Bvfub3Os8feZUY3FdzD/XMdpBI3OuM/ofBOb8POapSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gbtJRnnBl6shPBrcErojSGg4RkY9bLnp21NwjQ88yw5iVnVdQe5wlZJed4qdnObk5
	 mg8nm2kv/DQINzVUKBvGRZwffOvK9lLjj0Od8/eR568L4+eu0q6QEkslrXGkA4x1y/
	 gyFDx1IxkFgDU4ouDxxe4wp6gc4WU2dWDjw1ZcXA1ukozxc+8oP6KE9zht62deitux
	 Ft/O7WFlj6YdyoblG6z3Rs325ONPK1u40VcM11AgmY5Nf9hUoI5RR7z3yKxAzYNNYe
	 /wRQfnCb1I3bCsRVEEgvpaQvpxw3IjItkb7oEKi3GTbEeuvDkKz/oNWKZ89YgHydz1
	 NjXdDXZ11bxQQ==
Date: Thu, 19 Dec 2024 08:42:27 +0000
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 2/3] dt-bindings: leds: Add LED1202 LED Controller
Message-ID: <20241219084227.GO2418536@google.com>
References: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241218182001.41476-3-vicentiu.galanopulo@remote-tech.co.uk>
 <c93c89c2-7188-4b17-ab3f-a3d2f1972a21@linaro.org>
 <20241219082840.GN2418536@google.com>
 <e911eda1-fec3-4d2e-bb8b-655f6661825c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e911eda1-fec3-4d2e-bb8b-655f6661825c@linaro.org>

On Thu, 19 Dec 2024, Krzysztof Kozlowski wrote:

> On 19/12/2024 09:28, Lee Jones wrote:
> > On Thu, 19 Dec 2024, Krzysztof Kozlowski wrote:
> > 
> >> On 18/12/2024 19:19, Vicentiu Galanopulo wrote:
> >>> The LED1202 is a 12-channel low quiescent current LED driver with:
> >>>   * Supply range from 2.6 V to 5 V
> >>>   * 20 mA current capability per channel
> >>>   * 1.8 V compatible I2C control interface
> >>>   * 8-bit analog dimming individual control
> >>>   * 12-bit local PWM resolution
> >>>   * 8 programmable patterns
> >>>
> >>> If the led node is present in the controller then the channel is
> >>> set to active.
> >>>
> >>> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> >>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> ---
> >> Stop sending the same 5 times to people.
> > 
> > Without additional context, I don't think this is a reasonable request.
> > 
> > If you're a maintainer of an affected subsystem and the set is at v10,
> > you should expect to receive (and discard) the submission 10 times.
> 
> I received the same patch - v10 - like 5 or 6 times. I replied to the
> last one, apparently all others were sent only to me.

Okay, so there is additional context.  Fair enough.

-- 
Lee Jones [李琼斯]

