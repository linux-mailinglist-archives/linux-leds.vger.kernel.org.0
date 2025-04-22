Return-Path: <linux-leds+bounces-4515-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF78FA96283
	for <lists+linux-leds@lfdr.de>; Tue, 22 Apr 2025 10:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 988043AD7A8
	for <lists+linux-leds@lfdr.de>; Tue, 22 Apr 2025 08:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACA5281344;
	Tue, 22 Apr 2025 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGHE5gk1"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5691EB9FA;
	Tue, 22 Apr 2025 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310951; cv=none; b=Bgbr5WlkdJud9sHX3QFzsSGnyXWlT0l42pyidHxuegle9WdKTUEXt9gw++BMHxS72Iz0nWdywp/XniSBTvNjGU3MjXC9tHZvxJdwAo0IjqLBzk58KlFf+xyB/CL14PX3CbqMju90C5t3OhWyZJ/ntiofUbZbH+4OD1TKUIYCcHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310951; c=relaxed/simple;
	bh=hKd3sovezTE4oI9gLuxz2U+vzWmyXW67MNxppVUKeTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWpdso2Vw+ffqZrRsH62vqJblXhRom8r2RCPE06bQqt6oVzGOSBkVG9R0HfnOGVyK7j2FJgutK0mYUST3+m8fKMHdMCRRKJ5sPXLUG3XrhUfMzcdIVqqtNIP1peYaBvJVF5Kk7XPpcfq2vemjTC6/k2Hy1nb6aXAdZ/NCl4EPaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGHE5gk1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3F0C4CEE9;
	Tue, 22 Apr 2025 08:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745310950;
	bh=hKd3sovezTE4oI9gLuxz2U+vzWmyXW67MNxppVUKeTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGHE5gk19LSSenv+CK3/g90CC/FxG+lXLLqmuUeXoKymLlBKHH20LJXWpitIpXxnv
	 S6bbslIxGT4Clf128FO4v1VXePcu2SWPBcrBzRge5/yih5HjeWYUFWGieuQcHiz/cM
	 H+odr75lTSBDEpqRusyl01Kteu66O7zpzAbqcCfC3m2DLkzTWquq4qY2gTolVPhE6r
	 F528iBFdnvQNkNwRqI1jWyLmi6OLj/9pRpD5XF2g5ub9ltfH9md1m4c0exnJdz1Nz9
	 Gx1L8IJx2UoVXBwGAZBIe8CrARh3szphl4Pf8IICqI1sFFD2SMXri+pagoVBMwj3la
	 5OrZAGuOe7egA==
Date: Tue, 22 Apr 2025 10:35:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, lee@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] dt-bindings: leds: add TI/National Semiconductor
 LP5812 LED Driver
Message-ID: <20250422-winged-naughty-porpoise-645d0b@kuoka>
References: <20250419184333.56617-1-trannamatk@gmail.com>
 <20250419184333.56617-2-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250419184333.56617-2-trannamatk@gmail.com>

On Sun, Apr 20, 2025 at 01:43:29AM GMT, Nam Tran wrote:
> The LP5812 is a 4=C3=973 RGB LED driver with an autonomous animation engi=
ne
> and time-cross-multiplexing (TCM) support for up to 12 LEDs.
> It supports both analog (256 levels) and PWM (8-bit) dimming,
> including exponential PWM for smooth brightness control.
>=20
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  .../devicetree/bindings/leds/ti,lp5812.yaml   | 46 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/sub=
mitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


