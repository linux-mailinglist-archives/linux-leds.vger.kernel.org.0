Return-Path: <linux-leds+bounces-4571-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6E5AA5E59
	for <lists+linux-leds@lfdr.de>; Thu,  1 May 2025 14:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7F518912A8
	for <lists+linux-leds@lfdr.de>; Thu,  1 May 2025 12:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775021F03C5;
	Thu,  1 May 2025 12:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VId6+OGj"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBC8155A4E;
	Thu,  1 May 2025 12:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102397; cv=none; b=VguJG0vc4iQHCjGkPk19djbW37Qmrz8Uu17E84tHps6EbKHDm0COFLL2Ro7srvzFWA196Q9i4+l/KlR0hrYQaUmrb/3lFxgc7knrurN6XEyKjv87VitQe9UuzCvF39n3VebhVEapaNyXU76idDb1azKt0cTHdzYbLWVmVRpC6qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102397; c=relaxed/simple;
	bh=QBPgMJaVEvSsAddmYeGI4dVi5dgNgUE42YmIyAwebRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pnu1vcjUdLvkBgbfTklEl9Z0Ex7m383Sga8T7aQd/BRBLO89UFyYLN3ghHydNgOKQ6die7FMp4M+0dSMlYAFFSmvgPzDLPQfUm1v+wCbfopJLLu7JCAqWIDkPsZjcl50Ituq8mKaBY7FjRYPYxyG/lmtIOz3A33H06grpn8WTSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VId6+OGj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6993C4CEE4;
	Thu,  1 May 2025 12:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746102396;
	bh=QBPgMJaVEvSsAddmYeGI4dVi5dgNgUE42YmIyAwebRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VId6+OGjhASPoqoPqfA1XqR4ZK4ZWiaAQW5V/zGuFbaEzSBSH66jP/0NbPWkaDLrV
	 l9QIboVPhqjNZB/1PhqByrHNZcJUMwMfcQA1QvS8zkn55lYrgNEDWd/5+Te3n4eXRd
	 cB9R2WrNQunf51a9q2CF0lkfp0n5xYUOkrk/wx8IVY+UoKTg0Bfp8vvLgG5fjQPGp6
	 Cg7nrDQ66lL/iK4byz5CJ0bTc10uEiiXXCGYzVzGqkFoUPanUSWcV8L8wTvD0Q5USj
	 A2gPshXU/X07rnUpvR3NZB25KBan+ASzidBydRzmpc7ILSDfMBNxsxxhbqmG5K7Bdf
	 S2N7BBSYIIp8Q==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Jesse Karjalainen <jesse@ponkila.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250426020454.47059-1-jesse@ponkila.com>
References: <20250426020454.47059-1-jesse@ponkila.com>
Subject: Re: (subset) [PATCH] leds: pca995x: fix typo
Message-Id: <174610239551.3815020.15833106436939502361.b4-ty@kernel.org>
Date: Thu, 01 May 2025 13:26:35 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-39345

On Sat, 26 Apr 2025 05:04:54 +0300, Jesse Karjalainen wrote:
> Remove the stray space between the '.' and the 'data' field name in
> the PCA995x device-tree match table.
> 
> 

Applied, thanks!

[1/1] leds: pca995x: fix typo
      commit: 9062209d453b9755f7bc09724167f21c3c64bb62

--
Lee Jones [李琼斯]


