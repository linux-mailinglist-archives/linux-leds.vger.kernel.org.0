Return-Path: <linux-leds+bounces-3008-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A71996596
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 11:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B35A9281ACB
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 09:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBA318BC26;
	Wed,  9 Oct 2024 09:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHedLpo6"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D2F18BBB9;
	Wed,  9 Oct 2024 09:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728466660; cv=none; b=S2PKUUd1wxZ+R2Du3W65c4ngVooJOFUANsq4sb37qRQ3u4z8u5ZaOaQMGwqAk0B2Cxz3/GS0dgL2m3F6gZIcjru5RmOahC9OLXU8c53H+nhgPq+YzaMTb60Ha10RwNccPp4k+j4oRTRubkoTxwFu7NULzgM4oTN7FQXCItJejjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728466660; c=relaxed/simple;
	bh=7UMPfRWo0l1NXliH2ka1RLXVYiCw96J2+SdM6ym3csE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HhBRsHleKBcOWVAIx928z4bmSj7FJOD5gIsqRNC7yiU7Dit3YTpGpg0zD6gx3KlOftFHq3KgLYiTIZr1q+Kb2DrcgmJkjPFhVbr+rQt5idNdL29GlrpX5jPVy1Pf+MXxD6W1ofqwnELTPhafrd7I5KTqpCFNbXGbwgcr8P4f5gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHedLpo6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B926C4CEC5;
	Wed,  9 Oct 2024 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728466660;
	bh=7UMPfRWo0l1NXliH2ka1RLXVYiCw96J2+SdM6ym3csE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UHedLpo60PHuK5QWrc/1qCZhFmCl9v+dAk7wKVLAB9ree+fAH1F995yx3KwIq2m48
	 PPZkBWlZVt8pGUXqutB81VLADZWiMkj83geabybV79lNgOvDQhXat7sRY8ISD6dWIB
	 +HJ8UgSGFeWHa2tRnuBw1xV8MP3FYwjrWQJ1LMsbdZt/sgtCNcDrn5K+gjobRGP89k
	 AKwWAZiy98XzKraHcSsZZ4UH1aGlbaxVI9oW/9WLCtdZv3ItQO9J1gwDZPgrmP1vT0
	 XcNiX0jU9xZ1oGappyaYuSoUA5/PEkZnUVtCqtUBHdM+7LP2IMN4WoPqMqFMyH8vkA
	 vl87j2otg7oUA==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, aren@peacevolution.org, 
 tzimmermann@suse.de, WangYuli <wangyuli@uniontech.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 jjhiblot@traphandler.com, guanwentao@uniontech.com, zhanjun@uniontech.com
In-Reply-To: <B586A1E6EA476B68+20240920024514.1182292-1-wangyuli@uniontech.com>
References: <B586A1E6EA476B68+20240920024514.1182292-1-wangyuli@uniontech.com>
Subject: Re: (subset) [PATCH] leds: rgb: leds-group-multicolor: Correct the
 typo 'acccess'
Message-Id: <172846665797.454053.9925555083967235969.b4-ty@kernel.org>
Date: Wed, 09 Oct 2024 10:37:37 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 20 Sep 2024 10:45:14 +0800, WangYuli wrote:
> There is a spelling mistake of 'acccess' which should be instead of
> 'access'.
> 
> 

Applied, thanks!

[1/1] leds: rgb: leds-group-multicolor: Correct the typo 'acccess'
      commit: da0806e4e886a58ad258720042cb5b1fe32de728

--
Lee Jones [李琼斯]


