Return-Path: <linux-leds+bounces-5875-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A269C08FAA
	for <lists+linux-leds@lfdr.de>; Sat, 25 Oct 2025 13:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE9534E6EAA
	for <lists+linux-leds@lfdr.de>; Sat, 25 Oct 2025 11:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F3A2F49E4;
	Sat, 25 Oct 2025 11:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qY3zzU0B"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDC3221FCF;
	Sat, 25 Oct 2025 11:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761392601; cv=none; b=L3AQ3bqrHQar8SPQYXfsJCsrQfkU96xdKbYqt7EwpDxTKRIAdvrk2tiAmO9EHmSti+vsy6ZvyIKIaJyzCpjsgzJhpHJCoS7ZBszrA90CcLRrLqMvpNh8Zc/3Rcttp8L6ri8EUO8qG6j6a8qWLMBMOtqIvjNx7KWcD8FuD5V+dZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761392601; c=relaxed/simple;
	bh=U8ZjolBI69vwYbBLOOXTIFHjHMbX9nSgRhMvJN/3YXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FfU1q5Lk0q876Gzc2T/92V7ZGWNyBwGP1MVTMoWDfQrbl8JGzt6uc7xVjH76gGDdXQwPTpx9oyQat0WtAoHCzbSqAnLtxTgp2qojLa+SG5uAqEW5/PsZoxl998VPy2lM5lBse9UpbBFOgK/hx7KAlk1sqZ/txwyp95N0Ydz1WWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qY3zzU0B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3085C4CEF5;
	Sat, 25 Oct 2025 11:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761392601;
	bh=U8ZjolBI69vwYbBLOOXTIFHjHMbX9nSgRhMvJN/3YXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qY3zzU0BlDwcgYyoIETfdjREhehdg9jE6U8dknlrfvscLG/72yISLb2wn0n6hxaQS
	 hwOKbwJNWApk4Hdjraa5CBI2RyzzsOjgTPIEcTmwIP6ofBupY0aNfpweWgTAdlWpsM
	 FYroZlqBPW0Accfp8av1Hk/DxCmFfCR6RXK0PP4Te3PYf/IgWD13zoZu8N8uh1Z69l
	 rMpKivsOCxHxL4wLo04OxRb/7eSgnkbo6bg2zHfnF1MwSFJCbOh/+c+lYT0kcqMw3n
	 AgAeA9P1K8+/b8CGJPsaroVtDsgXZ2rhumH/hmU6zFNiUPdF/AxdG/4tTmsYhLmyQZ
	 eLxNGjyGP58iw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
In-Reply-To: <20251020-leds-upboard-fix-module-alias-v2-1-84ac5c3a1a81@bootlin.com>
References: <20251020-leds-upboard-fix-module-alias-v2-1-84ac5c3a1a81@bootlin.com>
Subject: Re: (subset) [PATCH v2] leds: upboard: fix module alias
Message-Id: <176139259732.53045.9637369283317590656.b4-ty@kernel.org>
Date: Sat, 25 Oct 2025 12:43:17 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Mon, 20 Oct 2025 17:36:25 +0200, Thomas Richard wrote:
> The module alias does not match the cell name defined in the MFD driver,
> preventing automatic loading when the driver is built as a module. So fix
> the module alias to ensure proper module auto-loading.
> 
> 

Applied, thanks!

[1/1] leds: upboard: fix module alias
      commit: c06a017439110debd335b6864bc2d69835624235

--
Lee Jones [李琼斯]


