Return-Path: <linux-leds+bounces-3740-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD991A0739A
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 11:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 950D518886A7
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 10:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95EF8215779;
	Thu,  9 Jan 2025 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlTn3qBf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69998201017;
	Thu,  9 Jan 2025 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736419490; cv=none; b=cza9UDAVvUbC8QfKnEktMrU31u96N1C8oXski8Qmo8gKcqNN1lDRNOIjCos7Wd8Sz93XIK3rnlHhRM3pOOnMb89wPCQWdgwdi8WfscVls3ZKUaWjuYDKbOxp595ib1/UnJLORtjJwdhWKtxcpUaG6MVtq4qXSn/y2k+H7EtdgXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736419490; c=relaxed/simple;
	bh=6qW64tcaNVuQcvr/bXNMsqkIFqcHbVYP22OKh44D8yc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iQXFwlsbuTaNMlycTj2GQ9eQF3OQaTGLUYKsjyLTzbjFkqaHuqRq7hSUQlNaZXUnEVh7QAJJ6cmPxwphX0qvNGG7wtu77TSQUWehjxdHFW7Q66yemxjv/ehpga49pmJw2lwfNGFBZlmieegjEgUB6PXuWXFwp61u2AdtYNpBdr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlTn3qBf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8AFDC4CED2;
	Thu,  9 Jan 2025 10:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736419490;
	bh=6qW64tcaNVuQcvr/bXNMsqkIFqcHbVYP22OKh44D8yc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JlTn3qBfLDPqSLk+mFjzOnZKsZL9nUXlsVSNKS5Cp1Bua94eSiwWX1e7gelK2aSVy
	 z6sDmXlmVCjbj9zZGT+7pTxHnDwDVoTm9ge2NwvMU7gMrxo4DXEILUbbHphtX2TLqw
	 TYTWY8ZqehP2FgjSISEdlkIKO+vlAzcOawPzQgNhRi7+LzFHdYGpmZLGlUAP5qxew4
	 +WD3LkYCUJbYwBVUzmMzdcLGdThzj/Pq1WlnprSqWndfNUMtMrVzfAbgc3fdXG2F0X
	 3CaAWGSD7xJKcht4Hdo+lW4YWBUy6ywdWd2ObO0i1jvWuANvV98ByksiwbOynYpMMg
	 /LJP81T16iAQg==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: dri-devel@lists.freedesktop.org, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>
In-Reply-To: <20241218210829.73191-3-alexander.sverdlin@siemens.com>
References: <20241218210829.73191-1-alexander.sverdlin@siemens.com>
 <20241218210829.73191-3-alexander.sverdlin@siemens.com>
Subject: Re: (subset) [PATCH v5 2/2] leds: lp8864: New driver
Message-Id: <173641948755.2580762.16328854038994481476.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 10:44:47 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 18 Dec 2024 22:08:27 +0100, A. Sverdlin wrote:
> Add driver for TI LP8864, LP8864S, LP8866 4/6 channel LED-backlight drivers
> with I2C interface.
> 
> 

Applied, thanks!

[2/2] leds: lp8864: New driver
      commit: e14d879292b0f7755c0d51b82a19b30859bb080a

--
Lee Jones [李琼斯]


