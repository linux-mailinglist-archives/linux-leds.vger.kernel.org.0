Return-Path: <linux-leds+bounces-2186-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96984927A60
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 17:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EC96B26114
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 15:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8751B1433;
	Thu,  4 Jul 2024 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/bNyZQp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C8C1AE866;
	Thu,  4 Jul 2024 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720107898; cv=none; b=LTJ4JRXQCjgLq0MXWNlH48xS8K7Yiwr/OiO+Yg1+TXQw77j6/YWcSWfg+8RHV+5aU4OizBgHsddcTlR9oN0ar7Hw2oyLVT86yKPC5Uj3GoWmOCLICIH2lFhnJnOFjmhPAmHKu7CIJ5VW0YcxQMnVl39TKsD2DQF4+uEaBxFDyuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720107898; c=relaxed/simple;
	bh=pe0qZW824RYLQdrWLN6JbDcEiz4bqPFVO0vYO6QXnNA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KBnheO9tAbDzre2vBbwV+vVR2/X35GkJw0eEfRm9P/mZ9mkczXHluVw4u1ALOIzHVrw6zk6exLOFYH68kU0bN5bsYH9OknATVe2hsOdoGmPSW5fh4nfePpKfxphMcW9KMv6fTUFjr5az7ZUyYXhiYi6eOCL4tUU5n+CTvr2dhvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/bNyZQp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFB4C3277B;
	Thu,  4 Jul 2024 15:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720107898;
	bh=pe0qZW824RYLQdrWLN6JbDcEiz4bqPFVO0vYO6QXnNA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=D/bNyZQpt7vir7CdT4vfbLs7WLIvsGPoqUR10rn3GHQ0Lu2qPEYm4gpGtYUhrU0qU
	 IMG8Eet5BMKgy4CM84BPNcrWeokulCSNjl01vJ+PeqigK055D7734c//H55XhpJMit
	 sVI7KSGS6Xe3qX3Nv7s8fWHGOv6PyMQ1RDTvmk3VspqdmP72GPsMn8tiVTS3D+zxk4
	 DT3F2bSWXjrSS4C/5cE7WuZuUgnBkJVbo7Wc1LfUtITYp/PP2dkKgLveWMquZH++cf
	 oiuJyriTrWMXk5RUiizw0H9v9CRKxcCrsr3byTr9bPNqgf+iSM1Q8viIRROodoTX8K
	 RiLXE174eeYKQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20240626221520.2846-1-ansuelsmth@gmail.com>
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH 1/3] leds: leds-lp5569: Convert to sysfs_emit API
Message-Id: <172010789704.505634.11689273055326411258.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 16:44:57 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 27 Jun 2024 00:15:11 +0200, Christian Marangi wrote:
> Convert sprintf to the much safer sysfs_emit API to handle output for
> sysfs.
> 
> Also better handle situation where on the same chip there may be LED
> open and shorted at the same time.
> 
> 
> [...]

Applied, thanks!

[1/3] leds: leds-lp5569: Convert to sysfs_emit API
      commit: 6f2fdde9096f3c4d35a7711c91a78c086be66aed
[2/3] leds: leds-lp5523: Convert to sysfs_emit API
      commit: 8eac0379d3bd9d048b1144d74d9309a198fd3f40
[3/3] leds: leds-lp55xx: Convert mutex lock/unlock to guard API
      commit: efd0d1cbb8c5dd1049922e839fa7d85811facd53

--
Lee Jones [李琼斯]


