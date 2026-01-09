Return-Path: <linux-leds+bounces-6600-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D93D08E2B
	for <lists+linux-leds@lfdr.de>; Fri, 09 Jan 2026 12:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 278F73004BB3
	for <lists+linux-leds@lfdr.de>; Fri,  9 Jan 2026 11:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D36301472;
	Fri,  9 Jan 2026 11:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6i1MAN3"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316523033CB
	for <linux-leds@vger.kernel.org>; Fri,  9 Jan 2026 11:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767958064; cv=none; b=Qs64FlMYv65XeeD0awK1uH+nmqTeBrrXvhUE9Fdn56LJjFdI4E6VHDsop7f8msLJ1IwsSb2Dz29yJsamNw7OegdgO0hk1TLejEi+We60fWNvaLVGSquhY0+FFoPT8CCHMGQP+1WI31i8oIzAseEdQmv3Q1VXHs5CQkRb19OBFbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767958064; c=relaxed/simple;
	bh=rpPYuM0LnzQ0TZa76BBZui5y4SQKmQrot6plP7cIbLk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iv19KDLywTWH4JUo4YI+LCBgDacgP2oM/zf+2dn/By83CdQ6wwgLVfsXXfw5BFIiVQika7LItKseHEODZfQJLEhG1aqPk78+Hw1HJTUZpqsM/Q9HzNKCXsHRWAEB+os27SA3o9A7l7bBGOgkThwZNizYfbW5PczpjPzQgqO1zNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6i1MAN3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCA7C4CEF1;
	Fri,  9 Jan 2026 11:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767958063;
	bh=rpPYuM0LnzQ0TZa76BBZui5y4SQKmQrot6plP7cIbLk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F6i1MAN3XLVEkT45ML/956rBcU1Vh3uhFxjqKEqvSPL4MzXBFSwqeu4OeA1e6Vwcj
	 KSMyTmyrU/colp0vewm8xy41gKXGo5T4jqLt52NuFYLx4yEdCmrcs35CTT3mJqjlpT
	 YT30T3Xk7YJtf9/ouMg2ALuZ0MI2VIcCu1YYe2CRkJwgve6vhf5f1xMp8dHll7PHnn
	 rfEmNycjL2O7oieN87d04pNrin4V759wN4veOicwsFTj33H9iBikANFwNuUzN+81TH
	 uHqNvRu4SC+2CNnCeC9nwFYXWr3He5z5KVgg+TSaZAPnSQFIVPC+YDu9N91B2UlFeM
	 QwkzWRDqk2iKg==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Daniel Mack <daniel@zonque.org>
Cc: lee@kernel.org
In-Reply-To: <20251219154521.643312-1-daniel@zonque.org>
References: <20251219154521.643312-1-daniel@zonque.org>
Subject: Re: [PATCH v4 0/3] leds: is31f132xx: add support for is31fl3293
Message-Id: <176795806261.1673131.13612117448821766839.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 11:27:42 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Fri, 19 Dec 2025 16:45:18 +0100, Daniel Mack wrote:
> This is v4 of the series to support the is31fl3293 with the is31f132xx
> driver, rebased on top of 6v.18.
> 
> Daniel Mack (3):
>   dt-bindings: leds: add issi,is31fl3293 to leds-is31fl32xx
>   leds: is31f132xx: re-order code to remove forward declarations
>   leds: is31f132xx: add support for is31fl3293
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: leds: add issi,is31fl3293 to leds-is31fl32xx
      commit: d7732462ca36e02d56d3d97ecd32ebb154521a52
[2/3] leds: is31f132xx: re-order code to remove forward declarations
      commit: f0ba6c40a2f013dee5841877d52291835be210d1
[3/3] leds: is31f132xx: add support for is31fl3293
      commit: 8d215505feb39e9d44b34fe488860b75240af6ed

--
Lee Jones [李琼斯]


