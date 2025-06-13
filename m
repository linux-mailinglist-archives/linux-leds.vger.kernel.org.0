Return-Path: <linux-leds+bounces-4798-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1324AAD8F8A
	for <lists+linux-leds@lfdr.de>; Fri, 13 Jun 2025 16:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29682188F118
	for <lists+linux-leds@lfdr.de>; Fri, 13 Jun 2025 14:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5034C111BF;
	Fri, 13 Jun 2025 14:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jk+XKMKM"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C9E2E11A3;
	Fri, 13 Jun 2025 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824759; cv=none; b=YJzghrQoiiriSQqzxFSv46+IfuHDDewsCV/JB3JoQ/aLgTiklwdxh6Z92X9l+1qdXsbZ5eaZIODsA3J+i8hbMP165r5DJyq1pCl+9gsZPuuJslpjX4EcfpcpncYYqytefSJKsopzoeTsGMqRA9kZ6xNPd6AIJcdwuNdGVmroPFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824759; c=relaxed/simple;
	bh=SMIGOvIv4UOgB6nUZsvM8VVKF0tt57JCf5DapqyJgUk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=thfTBSa5vyDN30mETJk4/wszd27kXFPMAeRe+hAKdykqRizao0D9uIYxSLX790ZjMpbejxNmFSVyUMLYwsl9/Ls+OixiNR8HdzZ9cbLev+3Y2YalvyxnPcv5cO1KtSvfJVTTxTdphVZyl2Q4EDZ+86fNnXCnX4iTDRSCe1ckN/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jk+XKMKM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463EFC4CEE3;
	Fri, 13 Jun 2025 14:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749824758;
	bh=SMIGOvIv4UOgB6nUZsvM8VVKF0tt57JCf5DapqyJgUk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Jk+XKMKMiNUQm+1jlgiXEUyoPQWnCKm2noZjDKbOynSPhNlWu9ixIuA4RnfT/FrPt
	 nOTWl6a9fl49dCBL6KzZLuJh+21BFgA4O+XrlvResEt9eR0OmOsyEuiMQz40EK+pMB
	 rn+sPNTQEudDHH3XsDtfe1pYghZ9KsvJFzy5OYqn9Ksy+rCyBC5YC42VD45kHRb564
	 TKcyNBZO63PdHfjKQWoVY1fPnM3MD1qscLiXVQmEIuKkVY0UvvrtJgqpJSzBNh3aOY
	 gluP8yzdz/c7ue9zYBYw6Z8h8AxGkKYVs+woJ9mlKT0PIiLuQvZZoXbH5uv+npex/q
	 vqpECc/u6R7Vg==
From: Lee Jones <lee@kernel.org>
To: Matthias Fend <matthias.fend@emfend.at>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org, 
 Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
In-Reply-To: <20250527065434.202622-1-lukas.bulwahn@redhat.com>
References: <20250527065434.202622-1-lukas.bulwahn@redhat.com>
Subject: Re: (subset) [PATCH] MAINTAINERS: adjust file entry in TPS6131X
 FLASH LED DRIVER
Message-Id: <174982475603.946253.15625144456457817574.b4-ty@kernel.org>
Date: Fri, 13 Jun 2025 15:25:56 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-459a0

On Tue, 27 May 2025 08:54:34 +0200, Lukas Bulwahn wrote:
> Commit 0d12bb1a7fb6 ("dt-bindings: leds: Add Texas Instruments TPS6131x
> flash LED driver") adds the device-tree binding file ti,tps61310.yaml,
> whereas the commit b338a2ae9b31 ("leds: tps6131x: Add support for Texas
> Instruments TPS6131X flash LED driver") from the same patch series adds the
> section TEXAS INSTRUMENTS TPS6131X FLASH LED DRIVER in MAINTAINERS,
> referring to the file ti,tps6131x.yaml. Note the subtle difference between
> the two file names. Hence, ./scripts/get_maintainer.pl --self-test=patterns
> complains about a broken reference.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: adjust file entry in TPS6131X FLASH LED DRIVER
      commit: 3bc1740d3157c9a9d30614371400f490dbbffd62

--
Lee Jones [李琼斯]


