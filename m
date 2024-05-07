Return-Path: <linux-leds+bounces-1628-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DB88BE477
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 15:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 501931C22B5C
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 13:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B03515E7F5;
	Tue,  7 May 2024 13:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NBtj+wwZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B5315B120;
	Tue,  7 May 2024 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715089013; cv=none; b=GBLBuKLuoDn75BT3s0h2XgUSqCyV5JMkaCr2hQk+WUHTHmOgF/+8Ej9pUWYHkc0KMCLKa7Ped+JWzzABammP4zRI+swRCHHLBuITb14OnDz0HGPuQLei6uWVST92ucjqLzUY4Nm0/q2X34Y2Ssu2c2KSH52MiJpd8Gl9S2fTN5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715089013; c=relaxed/simple;
	bh=8ZdZRvPpy8p9haCHUSb79/UqGYMNQOBxy8T7ffZURpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOo5q+MUBEa6OlAg77KJdYoUD/J4jcSmCI4X8pUMtiViDip+ngCTbjOOhuEHyoqRI7taqMKa2TlgUL+MY5w6i9SvdFUHO/CukheDuA+7L8gbkfCokViyAEq2GX3PbI06gJSExgbMazV+CjDW5dU4zGxaf7XeN3qkFOPWpUa0P/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NBtj+wwZ; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715089010;
	bh=8ZdZRvPpy8p9haCHUSb79/UqGYMNQOBxy8T7ffZURpE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NBtj+wwZR7gCX8gtvs1KtnlHA68KoPewfcROdg5rJqCgBsf2HvCPBW8Thc0+bH/4n
	 qMIM5KrOVjQU0hSrMhYjJW+Vg+cgO6MO8c98CtB719/xPpWorW+tS0MDtIPnJXCo+c
	 ycLA6T25yEsb7hCnkSmspVOmYI407EJ0jGGXRP/Y7ILPR/dJ/c3f/usSJOT8dnsNz3
	 bp70G4RDz58I6ZasmnjL86CzdOni+U/kmtqUgAe1SAZij6racJllxMlilhEsUDT/cg
	 r00etxpcA+3kxKPAOImfmZBNuPGmr3dxZfOMcvVM4GbuvsctAFWznLwLXgZSdX3/P0
	 pspjXnisVPe1g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C67A637820FC;
	Tue,  7 May 2024 13:36:48 +0000 (UTC)
Message-ID: <5397474a-7ef1-4005-83a9-854f77056ecb@collabora.com>
Date: Tue, 7 May 2024 15:36:48 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 2/5] dt-bindings: clock: mediatek: add address-cells and
 size-cells to ethsys
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Eric Woudstra <ericwouds@gmail.com>,
 Tianling Shen <cnsztl@immortalwrt.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-3-linux@fw-web.de>
 <a43a076f-7d7e-4c7d-8be1-45569c7b2c16@collabora.com>
 <6A98D99E-C64E-441F-9496-EBF39141C4BA@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6A98D99E-C64E-441F-9496-EBF39141C4BA@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/05/24 18:01, Frank Wunderlich ha scritto:
> Am 6. Mai 2024 14:48:58 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 05/05/24 18:45, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Add missing properties already used in mt7986a.dtsi.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>
>> Fixes tag? :-)
>>
>> Cheers,
>> Angelo
> 
> Should i use fixes tag of binding commit or where dts (-part) was added?
> regards Frank

You're fixing the binding, so, the binding one :-)

Cheers,
Angelo

