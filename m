Return-Path: <linux-leds+bounces-4487-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1770A8A4D4
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 19:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 002B9440161
	for <lists+linux-leds@lfdr.de>; Tue, 15 Apr 2025 17:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037F213B7A3;
	Tue, 15 Apr 2025 17:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkCZLFnj"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8F64D8CE;
	Tue, 15 Apr 2025 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744736488; cv=none; b=lvCWn8noOjTGjGINjyMSRhI0QmghmDpsBvedqrocdIk1ywi8kdPcTWc6ZrLjJc9rgDFj/H5lS6ieUF+iPOsSA8wBtGduU/mjFgJ/WXd6AfPujjQN7AT80PlLe85a29hWtpxL7H6wvV9BWia+xRajH9qLSS5r9dvv7o0fRYA9yG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744736488; c=relaxed/simple;
	bh=BxoRJbK3LjBqCSGzXlhs/h9cYgB2mhJPF0X/UK6Z85g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bGngmaOqjIyc6jQNeK0aHPgGrf3r+ylHWP67QUBsO77sUtt4L585ZGfipSkxPmqdKKFgz0e68UGFp3t9ijr2CH1nuKLg5oUs1/lKvnNRQwkDrSsLEEAmVCwiNkMEsvxJrH4dQ8M5wNfVG/CZAF3hRpvfAxiiXvhhGChiKcyeP1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkCZLFnj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B63C4CEEB;
	Tue, 15 Apr 2025 17:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744736488;
	bh=BxoRJbK3LjBqCSGzXlhs/h9cYgB2mhJPF0X/UK6Z85g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jkCZLFnjHe90LKqrjMJxYOoSje9jtS5Du7AgmoAE5sB3Xh0bQjrjMfgdt22nhbnF0
	 o6etEANUOhFdXvHBBmMtfbzvJ2y/HhcklDi5y7I5GuDHT6l8SVSSp8fkRwSQiAvx3v
	 XXZGHi96hIR+m/55nC42RqlrXoXkOpgzWAy9tJXMfr+7msUXeMPQbMrVx9ie0Vo4NW
	 WDc0bsDeoVnPVNr3afR7pf/ojEarJQDXWHkTomOk0sY+nVxmB54gDBlI8bnvhEL7i6
	 PqJpLi0Nfdj2TsM1dccb09ZNVyA6eWsVz6Q0c4C46VSIUF+RuOGiy9+gr0IiXEWbQo
	 LeiceQyUL2Yjg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Davis <afd@ti.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250411163428.897582-1-afd@ti.com>
References: <20250411163428.897582-1-afd@ti.com>
Subject: Re: (subset) [PATCH] leds: lp8860: Remove struct member regulator
 description
Message-Id: <174473648708.3001100.5766515898969039785.b4-ty@kernel.org>
Date: Tue, 15 Apr 2025 18:01:27 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Fri, 11 Apr 2025 11:34:28 -0500, Andrew Davis wrote:
> The device local struct regulator was removed, remove the documentation
> description for the same.
> 
> 

Applied, thanks!

[1/1] leds: lp8860: Remove struct member regulator description
      commit: 9cd727847ae34515fe8596d11e06a9730a773353

--
Lee Jones [李琼斯]


