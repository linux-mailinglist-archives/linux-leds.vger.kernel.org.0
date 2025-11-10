Return-Path: <linux-leds+bounces-6065-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B88C470B3
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 14:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3D723BE53C
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 13:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37EF23054D2;
	Mon, 10 Nov 2025 13:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CW5VnlND"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0905A2F6915;
	Mon, 10 Nov 2025 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762782476; cv=none; b=eNl6HoN5USUirb7QwhDJPjS2Rwy1+Wuesjsxt+kQu8j5Ru1Tj/rr7kSVyQA9oCmCEsyqzHDUO5c9J6N+ekoTU9TNRPGLFjwhBVBrx50UnBWHFLahDFv1ZHrujmJwfBsy1MQRRZR48rABZwncgmsLAEjdPPtRrhHCVwzJwvTJNSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762782476; c=relaxed/simple;
	bh=A7lr2LrvBFmcDLApeRBjnBjJ324Uj8x6sVYi9mBW+C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWzAB+I/4hjtdcbav6hIUhOw4lVec7GCLV+bL7u+GOP9zabpMsMqacEKAOze3IbNImNb4EVov2FB4O4QlvQVP6L7Ocz8RbHbE1BH9lHHmo9mNyHiOZ4qRV4+QaU4/9GyzGD7Llf8HZZ+Gi041JeYIsZ9X2bnJpBpVN/i0ENoU/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CW5VnlND; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38CFC4CEF5;
	Mon, 10 Nov 2025 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762782475;
	bh=A7lr2LrvBFmcDLApeRBjnBjJ324Uj8x6sVYi9mBW+C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CW5VnlNDs0ntjgzY5b+Tz/4O07oZEAQzo9CAYfSJhyFQBD2/pbbthFEIsDyKDp3hB
	 aiysJubGXin0vHJV0/xHjso2jH4qEbtUleBkQhwVL1Ex5tkJKJXiuu/5Iv2KDkuGw+
	 jcZpiX2hC4V7HCCyAZqJKup16o5VVX6bqFXBqxBNhee3+UYhkL0sjsfZqSUwKd1O+0
	 ngLmq9vZTZGiJjyFLac14kRDd1hsZ/19JrZCTpG6PYYDjDRi5ZQ/ATbn6pFJn7hwMG
	 LP59OJJdc6krKXQvO0rr9ov1dzIesPfQTt/3CIYa9SmeBOZtK8Bl0E5DdE7iOjUdYx
	 1HuaeAi8oLgpw==
Date: Mon, 10 Nov 2025 13:50:04 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: backlight: Add Awinic AW99706
 backlight
Message-ID: <aRHtjGuzLHwNGe_o@aspen.lan>
References: <20251109032240.3422503-1-caojunjie650@gmail.com>
 <20251109032240.3422503-2-caojunjie650@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109032240.3422503-2-caojunjie650@gmail.com>

On Sun, Nov 09, 2025 at 11:22:39AM +0800, Junjie Cao wrote:
> Add Awinic AW99706 backlight binding documentation.
>
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

