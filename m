Return-Path: <linux-leds+bounces-5108-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F69B0EE7E
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jul 2025 11:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ACC06C4B0C
	for <lists+linux-leds@lfdr.de>; Wed, 23 Jul 2025 09:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707A927E079;
	Wed, 23 Jul 2025 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiWUv4mI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47573273D6A;
	Wed, 23 Jul 2025 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753263165; cv=none; b=QrpALvln3ZsZ1mUac4LKz+ikP/cn5ebxGRomzj4+5ii/PfM9ol5m2/CsA8EmQKiQggZAmD/zJyEcpoAyJtHSnCYfAmTCSZW8X/zxx4ft9xytGuPCdiEpn823mo27kkiNHoAkCUMMMIlF/h1/Z74BGla/KSq0a/NnwZHOwmnMUdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753263165; c=relaxed/simple;
	bh=f5ySD31GZrT2SWF1i81tV4UkRdUkZDdb4jOV3wN4vpY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XGTqOtf9c9AO4gssf7RLLfnd55Mg65Q+S9cCF4byzUf/6an4myuFGfI2UIB44j7Lh3Ko4xFp9kSBsfR495HMq0PoXEYfoRA2yCLSI0qtT2KDIzQ3l/diqVQwF6MBp0xqDs4SaMoOEzUU4zHQOnKQXUltB5kNycwCV6OPtyOKFD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiWUv4mI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D72C4CEF4;
	Wed, 23 Jul 2025 09:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753263164;
	bh=f5ySD31GZrT2SWF1i81tV4UkRdUkZDdb4jOV3wN4vpY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OiWUv4mIy9/zlhLNZWZi+msN7GOaq+cwj6B4ngTD7+K7zF3VIrEJqgWbGaK1t9mIe
	 9/bczfZKmAYY+jFFpNptwXpoklqBvtn+MfjZmcgHbbhpyJiZ9GO4oUSeYMajIR4koS
	 zYrP0JhYNzoaEzdAluLYvGz+gGn2W5l7/E4FlRMzlvxP1u+JyvvU1eGGtm85KoVE6h
	 ZnhOqEnRe9EPdexQiZzyAxG/F3OQMT1zm/MmxN2Uxm5VsIErlHfpnwSI7xp9ctpjr7
	 OjKG6bMd6agmfm0gdaLStnTwQldR3FIPfjMUc2x6HbIFbuGxBgGgZraQ89gVvdL5Uw
	 sZGuGq69bpMzA==
From: Lee Jones <lee@kernel.org>
To: pavel@kernel.org, Fabio Estevam <festevam@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, alkuor@gmail.com, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250703144644.2878253-1-festevam@gmail.com>
References: <20250703144644.2878253-1-festevam@gmail.com>
Subject: Re: (subset) [PATCH] dt-bindings: leds: ncp5623: Add 0x39 as a
 valid I2C address
Message-Id: <175326316289.1723944.3466153543911478019.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 10:32:42 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Thu, 03 Jul 2025 11:46:44 -0300, Fabio Estevam wrote:
> The NCP5623C variant has the I2C address at 0x39 according its datasheet:
> 
> https://www.mouser.com/datasheet/2/308/NCP5623C-D-64591.pdf
> 
> Make 0x39 a valid I2C address in the dt-binding.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: leds: ncp5623: Add 0x39 as a valid I2C address
      commit: 4903924ac7ef31fbbe48b3261b1bc86ce6cd7e97

--
Lee Jones [李琼斯]


