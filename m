Return-Path: <linux-leds+bounces-3555-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C61B9EAAB7
	for <lists+linux-leds@lfdr.de>; Tue, 10 Dec 2024 09:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94E24166843
	for <lists+linux-leds@lfdr.de>; Tue, 10 Dec 2024 08:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6550A23098A;
	Tue, 10 Dec 2024 08:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLfoiTtu"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F1E38389;
	Tue, 10 Dec 2024 08:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733819503; cv=none; b=jdqzorO9kKoIrC/hBO4c8egD27CBukA2kw0LJgiKGnxFzYP32K2SD2j5nP6GcHRG1uw4guZHCtZ/MU5JkBz9hJtRBcMG2Z/PCC8ffO7FxaRMflLoas+U4UII/vCSiYN7ih5JUQ+/Rk5Ct+cOfVozZtK+l/6ci0sO8IRmU+lLqCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733819503; c=relaxed/simple;
	bh=IqvKMQWSIXJGAccIjtznu0gLl18o7vkKcnIk+pvfNsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXhZpWgVTGpcQ3aNXEKZo2AJcEStwtAXsV4U3FKr6O9wTw/rF8jw3geX7bfhmZWFyT7E9gCau1RsaDXaV8oKTP8k0lwrksZUZxPeki73vdYkUqKWW/5GK1lNQ9+fg+SEQlgL5YqQbQk+Egx+sJeDSqS0DdAaLxpwkmsdxpwUCiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLfoiTtu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF6FC4CED6;
	Tue, 10 Dec 2024 08:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733819501;
	bh=IqvKMQWSIXJGAccIjtznu0gLl18o7vkKcnIk+pvfNsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLfoiTtu9dVkcxrI2fiP4olwKnTPyIpwXDzUpCFZRWrqiycSB9OYhYhsafMyKWGXL
	 2m+PvncE+Whi0J1BQkp4cjeqUDdo8Tg9T4bdtk6yOR2OxV5Ma71vhaanLX2N/hCrlx
	 C8M5jso6qT2ocFzgFPhWKwPwGLHeD/JPlYi0qtj0WggqgIVUjdm74I9RiwjOxCfWqV
	 RsHMbMBWS7gUVfyxHsrqkWEVn+fnAANYJ3JoLgM3mYk5YRQUBg42KMMePzRD1mwsIW
	 BSZsWuwJfAvmLSMd7luXH4ANGCxASyljcXha8B1VFhPVSY+x4fhOM90iPNLLt/V2Ss
	 4QQLByiWA3LFw==
Date: Tue, 10 Dec 2024 09:31:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 bindings for Apple DWI backlight
Message-ID: <okhsrlpr6qu6crzzhqzbvgwoqwcxefynceje6pyttb3x57vrsf@hyilj6xo23t7>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
 <20241209075908.140014-2-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241209075908.140014-2-towinchenmi@gmail.com>

On Mon, Dec 09, 2024 at 03:58:33PM +0800, Nick Chan wrote:
> Add the device tree bindings for backlight controllers attached via Apple
> DWI 2-wire interface.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../bindings/leds/backlight/apple,dwi-bl.yaml | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
> 

<form letter>
This is a friendly reminder during the review process.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Thank you.
</form letter>

Best regards,
Krzysztof


