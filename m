Return-Path: <linux-leds+bounces-6578-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFD4D0283A
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 12:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5AEE31608F0
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 11:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE3944A717;
	Thu,  8 Jan 2026 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXyvnaNt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B2A4921B8;
	Thu,  8 Jan 2026 10:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868988; cv=none; b=X4Bpyw/7Jv5Xfnt+jLUZhj4kOJFZgRLZRa7fpwjZkktH8hfRln62PEQyzQsx+NgsLyngdaPVSR/SCaGirSyRB33ooFovw1Pe7AJ0zGQnJ3uJ7Wha61hRFJDGdd66R6/74i3mfINl5CJk8Ho+EwxEeisJcLjhgVUVystXFgr3Odo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868988; c=relaxed/simple;
	bh=lzJcKNnVkFd6dKQeDFrT1No+Tn6LtyPpmkciRHBHnn4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Udkbisddstm0OslUbqak1J7S8SzQBei51aw6Ws9nI283KVyxDms3ZiswAtsgCPJ/TfvgnxOuiz/Oag81+MohHQpBMR8tOA4MOikNdAWjjDPenhn0sZah9tDVMHkn7n9E9l8VP4tfyoQikARWbmcJEpfYrDgJtmNniHU1crqZTVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXyvnaNt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1821DC116C6;
	Thu,  8 Jan 2026 10:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767868986;
	bh=lzJcKNnVkFd6dKQeDFrT1No+Tn6LtyPpmkciRHBHnn4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NXyvnaNt6CIhrayvqo8AubylKf9gZhPICQEWHBqjc5BSHsViMgxugrhfGnL9emD7W
	 QG/BSHXtfOBrLtyj+vXzuHsj+ZUrde9OCC7te/9szmpz6XlQ1jFt0hLW4/oS6uKqYv
	 oGzTFqkZEoXV1kzlQcr5A/6hH7Xj/2/ws+earaVH+NZyVZS4e2N/dXQ115e4mW5UhO
	 ap1sT2GkLJ/l4nIBaLkdbqhrotEOP7k8nzCVgYHlaGRMgP/TUmDj5MgiAPxC7ao2mm
	 nes9iaopuwKZKH7WYgQCZbjk/KhAFAnPfFvY8+2HA3UoHAZcRiqJKT1DqToS3DJwQR
	 GhFQdQT0a5BIQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251201042612.2099239-1-vivek.balachandhar@gmail.com>
References: <20251201042612.2099239-1-vivek.balachandhar@gmail.com>
Subject: Re: (subset) [PATCH] leds: lm3692x: fix kernel-doc for struct
 lm3692x_led
Message-Id: <176786898481.843981.9772484972862864512.b4-ty@kernel.org>
Date: Thu, 08 Jan 2026 10:43:04 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Mon, 01 Dec 2025 04:26:12 +0000, Vivek BalachandharTN wrote:
> Building with W=1 reports several kernel-doc warnings in
> drivers/leds/leds-lm3692x.c:
> 
>   Warning: leds-lm3692x.c:122 struct member 'boost_ctrl'
>   not described in 'lm3692x_led'
>   Warning: leds-lm3692x.c:122 struct member 'brightness_ctrl'
>   not described in 'lm3692x_led'
>   Warning: leds-lm3692x.c:122 struct member 'enabled'
>   not described in 'lm3692x_led'
> 
> [...]

Applied, thanks!

[1/1] leds: lm3692x: fix kernel-doc for struct lm3692x_led
      commit: 101bc85a19436825e8c94a27e792cd9750aad708

--
Lee Jones [李琼斯]


