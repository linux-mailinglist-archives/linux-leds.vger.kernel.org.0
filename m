Return-Path: <linux-leds+bounces-3071-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D03999FD1
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 11:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6DFE1C24CE0
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 09:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E89120C491;
	Fri, 11 Oct 2024 09:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwo4xkBN"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CB920C48E;
	Fri, 11 Oct 2024 09:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728637769; cv=none; b=fZfWwxE28DaKGq0xqhkSZaackeO+BEHQpeidjof0pkTitcoaeuKg2IDNO8wnPPQKcSKQgWZWeuvrRrVLISRoBtOh65TfTCEqutr0zuZOnwK3Dm5yDT2ahrmXf/Kc8DDVG0vY6/2V405PvNkP9mQKZ94VcsEL0dzysC28iw3tUuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728637769; c=relaxed/simple;
	bh=WTLPG5TpzTM7pI72vmZiWR6qaBN/V+V9dD5cQ/3G57M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FafUmSOAVEqEpJFEVy8Qq4ZHvYiZb+BWt0q3Z/9YYOWkT/MaoDQkAmFznuXQaVTi0gy9Kya2PKc9PP2LlN4bfrMdZad0m6iVHYz5y5jLX89cbQIkrPsAfVU2slaYRai+puhGIKTunKTezxVvD7eXvM1IDKRnkNkFbxBepzcpu50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwo4xkBN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5440C4CECD;
	Fri, 11 Oct 2024 09:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728637767;
	bh=WTLPG5TpzTM7pI72vmZiWR6qaBN/V+V9dD5cQ/3G57M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pwo4xkBNGXQcKhzDdN0UMvdmxZDavsXaiiyKAQ2yLv5R0N9RJfSasHApgiP7Q7SDN
	 IeuvtaSAtZodVlV5YP/MrDgIoJi1i90UEPdQ1MRz3Ae3YGJgp2reXmEIQMSyJ4Pmv1
	 dyMWlIOAY0ooMC1Xz/Vnv+B20QA92u7upFHcgBJ9yjp7Z7FNb3w9+Nb46quafOv1C1
	 QZABjSPewnJs3wU5aXxZnLXrKZw4odH2q8rk27bDoTZETvtXCoPRaUHTyiFJ68cjAr
	 bLhUyg94ve5dyfyEl9KrYaEFrQaAIO4yWJMnFo2ehqL/F3wLrMoqEsHoRLxqR9LJpg
	 +FBhxI2Ori9dg==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, 
 SurajSonawane2415 <surajsonawane0215@gmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241006131337.48442-1-surajsonawane0215@gmail.com>
References: <20241006131337.48442-1-surajsonawane0215@gmail.com>
Subject: Re: (subset) [PATCH] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
Message-Id: <172863776565.3130628.18378710932238203204.b4-ty@kernel.org>
Date: Fri, 11 Oct 2024 10:09:25 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sun, 06 Oct 2024 18:43:37 +0530, SurajSonawane2415 wrote:
> Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
> to resolve the following warning:
> drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
> error: uninitialized symbol 'ret'.
> Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
> access.
> 
> [...]

Applied, thanks!

[1/1] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
      commit: b5a5659aebfffbcddb81abafe042fb4044b6ff9e

--
Lee Jones [李琼斯]


