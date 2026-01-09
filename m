Return-Path: <linux-leds+bounces-6604-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9D3D0AFEE
	for <lists+linux-leds@lfdr.de>; Fri, 09 Jan 2026 16:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7189730A23C9
	for <lists+linux-leds@lfdr.de>; Fri,  9 Jan 2026 15:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22C4310771;
	Fri,  9 Jan 2026 15:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhI0up0B"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE41A35E556;
	Fri,  9 Jan 2026 15:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973051; cv=none; b=bsGTR0JYUowrDQ2ZsqrPG5q55bU/CxEKxLpchVNfvMF/l/2q7Rq45OXGNbjnixUrFDQaMbQ3Ag5c7PXUV3SJoGPDNaFhHksBntVGjJ1bvItrMmqjTUMShbPk77v0gelAVQrV+yIn6fNkrzuz1ldwL3YzgKGAc6rWhfYhnElj7ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973051; c=relaxed/simple;
	bh=7sWFWoIyKvjxSdBSLuErcUB/kLXgmnvuD5VSC5WD7pM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iN70stxxTRfH2Mkr3fWNueC0dgdnddRnUqxFGTIRR3cMxjTye/a5u/34Io2EsaI901J+HnZkf4j4hmMcTTXWpAcepV5dFYk/g3m+vuNpAvMdN/vzVQkJ1N76B/Jlr2DDKQja8AbioK98CLhhlfKIp5uYeMswAfv8nRnUXfc9C7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhI0up0B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AAEFC4CEF7;
	Fri,  9 Jan 2026 15:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767973051;
	bh=7sWFWoIyKvjxSdBSLuErcUB/kLXgmnvuD5VSC5WD7pM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=mhI0up0BnbKuY0mW8RyyKTktGAY1glnkfFU6LKD1NgTifzOmO+mow2TKkVKyeGIjB
	 651kl4DtLAFNFA734FnIxNPH22UoxYGpYd65VGcqFC2JUI5TGmaKE8VhR3ibk7vA29
	 qBfdprrJwtfVt9EUjsDK9Syk/jwudKcCVp9txHzAHE2kGmj7AwC9oSmHWjvCgyk/35
	 mQCslfLKmLC5iNsYs4UGrMjRF5jQHbmRDb4DXZS3225FT5bzBN5xo+g0PDjE4V7xSC
	 zJOpiCsv0EowRXaqsp+hlUhAFysJpFx7o3SH8r7EbAAo6XmjNQeupp65IJDv6F1tBo
	 vaaBu3a02+YRQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224124521.208635-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124521.208635-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] leds: lp55xx: Simplify with scoped for each
 OF child loop
Message-Id: <176797305010.1816796.1312096140908987426.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 15:37:30 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Wed, 24 Dec 2025 13:45:22 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/1] leds: lp55xx: Simplify with scoped for each OF child loop
      commit: e257dc532c20bd93f0076c18cb5ffd739a5f0bb4

--
Lee Jones [李琼斯]


