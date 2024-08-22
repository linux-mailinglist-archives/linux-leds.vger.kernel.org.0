Return-Path: <linux-leds+bounces-2514-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6B095B774
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 15:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A0FD1C20DFC
	for <lists+linux-leds@lfdr.de>; Thu, 22 Aug 2024 13:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8FC1CB336;
	Thu, 22 Aug 2024 13:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtiKppkF"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6528F1CB125;
	Thu, 22 Aug 2024 13:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724334561; cv=none; b=Y2PDTBerpUNjTT50pl8YwxeqWas7DOX3jBwOTJO1Okutu8bOwW8W2uWpyvCfACZ1he/UMSVeLtVPs+VxWmSYg62uebdUAdUmjL1daBsuaoJxB7A+FbyW6dnCA2RZjGmL2dsCI6511oE1x2cdaoSSsIiEEwbZ6fyqOJWFxuGQXAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724334561; c=relaxed/simple;
	bh=vJ+CrReOFZMBGZC8d/W+97S3DohCr0aznuJMYNrDB+s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PtVMr/+UELggcqAt6LxYAV4bUOGyZH5BBr/D06eqxolSXjeUP73mxv+6NAyZe8ygolts1shbL8J6dCTc3PQJCEGWn2yctvA95x2wgvGZEMfL7wWsFcON2lOkZdIH7wyimU9cy4/8jrFPZj4GM2+3OMdvvcjo375YFmmgHzoEX+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtiKppkF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F107C4AF09;
	Thu, 22 Aug 2024 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724334561;
	bh=vJ+CrReOFZMBGZC8d/W+97S3DohCr0aznuJMYNrDB+s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UtiKppkFKT6jK4BRTOXg9MkIgIdFVzN4/c8GwxJiLgB3yarT/HraHBxAG02cyOZG4
	 WqYEFgMdS5u1SSaXO653iqjkA7mL7z4xIN3V04oJeT0HXcuFgZ5spHFnQK+jPh0EQ2
	 Z2UVKiBqXDfxnmxyl4mWSXZdfp7nWvjuR2GOLqDTucVVlcqiiUiBO4D57iJwZ1lKqY
	 LaTSyV93NUwoed6nCxtBh+1xr4oIlpbcT41MnnPioviGMXKBm7yExyzCdAL6IEWK5d
	 t4x5188Ole+JNimTVgmuLAH4qSLh1ghYlPEL/DnPCuxcEq9T6iNw63x2xX5nzDvLYo
	 L5cGTwl2lM+dQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Huan Yang <link@vivo.com>
Cc: opensource.kernel@vivo.com, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240821013725.785956-1-link@vivo.com>
References: <20240821013725.785956-1-link@vivo.com>
Subject: Re: (subset) [PATCH v2] leds: lp55xx: Use devm_clk_get_enabled()
 helpers
Message-Id: <172433455938.1332530.6993739238000229166.b4-ty@kernel.org>
Date: Thu, 22 Aug 2024 14:49:19 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 21 Aug 2024 09:37:25 +0800, Huan Yang wrote:
> lp55xx lp55xx_is_extclk_used get, enable clk and
> deinit_device disable and unprepare it.
> 
> This can use a simplifies helper to cover. And no need to save clk
> pointer, this can save a little memory.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: lp55xx: Use devm_clk_get_enabled() helpers
      commit: 4968f6721332189d36d6d799be61325921906a8c

--
Lee Jones [李琼斯]


