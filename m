Return-Path: <linux-leds+bounces-4539-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC3A9B00A
	for <lists+linux-leds@lfdr.de>; Thu, 24 Apr 2025 16:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07296463EBC
	for <lists+linux-leds@lfdr.de>; Thu, 24 Apr 2025 14:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A85157A48;
	Thu, 24 Apr 2025 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FthEum8M"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFA2130E58;
	Thu, 24 Apr 2025 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503359; cv=none; b=NPbWhjEhyAcmq5ZbROKFN3ceOs6fQLSelhTWZo4EDWq7LeOw78bYsGmctwQ68wu8uG9bPfVlNG2tUimgUZetdhF6bq1ewC+W5bweV/mouJLPsNDJkngRkGVXNqhGZj9/8AL1YuMME4xRaPeHeZgIr9zfoTphVveYLfli9uEFgAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503359; c=relaxed/simple;
	bh=71RlduJG9iRxS/BOeSlt0NKUEkotannGaRL0JB02fzE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Hjh2gKn5AG53urrcLvmM7qcJl9wfvs3zHzipKKGS/8fdi8P2KfbrT+KyA8cfZe4b01y+LqVQorcJ1cLljbo2pt7AZi4td4FdpkzBNccorT4uaoApwsgg1FNi41Kqc8FZub4kGpPm/CHb73KPthNbrW2sCjjM+ctAxIn/tYDBoyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FthEum8M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88DBC4CEE3;
	Thu, 24 Apr 2025 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745503358;
	bh=71RlduJG9iRxS/BOeSlt0NKUEkotannGaRL0JB02fzE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FthEum8Md/35EYYS50nUIGrJD0QRW7eGDOh10eMz9vdNbIXSRkPJHG8/J7PgPV21h
	 6/QAHbf1AWriM22yw0Vq5elf5/UlKd2s4Hr7m0z+kZ0KI3cG6PwmgX/xNoPp1mGEqP
	 FfOdHAbfILAIY68XZt/qI+uwJNbie3+/cIBl7cDThAPZST4UFab87OJTXAsaIV2X98
	 9rerAQYMqkKFxO4aMm7UlOZ0soqPaxXgU9lEypJ3AASnwAH9O4AmB0J0TXQEjdx2jk
	 Rue8noiDF1ctJRY3eJp6bWC5AnE+lLVZ5ueuZT3K54FMngJKgDOj/IXqnD99t+a2rB
	 TGeVUT0OpotUQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20250417070507.24929-1-kabel@kernel.org>
References: <20250417070507.24929-1-kabel@kernel.org>
Subject: Re: (subset) [PATCH leds] leds: turris-omnia: Drop commas in the
 terminator entries
Message-Id: <174550335744.1379497.8595889119124483748.b4-ty@kernel.org>
Date: Thu, 24 Apr 2025 15:02:37 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Thu, 17 Apr 2025 09:05:07 +0200, Marek Behún wrote:
> Drop commas in terminator entries of `struct attribute` array and
> `struct of_device_id` array.
> 
> 

Applied, thanks!

[1/1] leds: turris-omnia: Drop commas in the terminator entries
      commit: c5b44f3d3b177ae8e4a59fa522e21cbd6af3faa7

--
Lee Jones [李琼斯]


