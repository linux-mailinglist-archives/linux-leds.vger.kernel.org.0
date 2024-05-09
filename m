Return-Path: <linux-leds+bounces-1641-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E15C8C0FB4
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 14:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF4991F22153
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 12:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA24913AD38;
	Thu,  9 May 2024 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jGBTBGe5"
X-Original-To: linux-leds@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA0313119B;
	Thu,  9 May 2024 12:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715258381; cv=none; b=a+HYxsZpgXbJGT2ocFgDuCqLObOHJy4Dqwqo0d9q90JRKeCPimDELdlMnKUvwxkPUL4YWN+zQarKJXLK5/ZRNKrIRwESzpX5e9AoW0k665eVDzgLt98zNlzHlDV+4B616TAW8DoHbMs+fAR6x6lWc283hQERQ9ZTBKIr9VMmV+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715258381; c=relaxed/simple;
	bh=h/H+VWcrKdPCeRsMnTJ5qIW/usfR2btKbHYoM/e3sD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jga2T4g1SrS1zUwh9gAZctc2dazrMjTSeovcAkw75/+RZKtintphZJHdLntEmJT2AF4Lu+c1n5nSjXej3VRUXjfn9PY3nbU8cRoGL52E8glWtbmdkYoK9DusGKJoP821bJZXkKVpOXrNo583rqHcz3eVObf7z8IQiRkOLk8O3+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jGBTBGe5; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715258378;
	bh=h/H+VWcrKdPCeRsMnTJ5qIW/usfR2btKbHYoM/e3sD0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jGBTBGe57sd0zXCM40msbfzUhN3DdM19CrtaY0pKzsFqrj/Zk8Dq7VMsBy0vr8LjD
	 HCaw103NG8IgiSE5e+Rl3UbhMo+xn/s3c8gN+746bkRoHgARaPBf8saDRif2aBpv4i
	 VBdcJF1LOWox2DwYr91aMANTUO0fkoOySbgdBDoPLt/Xrg8HO0s7HKCb6tNJP0MlZW
	 ULqu/bktBbVdv1y1lMtdKbpiBV3JXyGk7XSWXV/E3g6Xf5ZCg3tvmyi1DsRK1XTPGd
	 0Ktk3LQ5ZgUv74FatyvLZpT08HJVxRRQsICZrwDYISOz/M8qPZmA1R8g4Cbk8NTFsq
	 oRommdfpEWppA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 622373782172;
	Thu,  9 May 2024 12:39:37 +0000 (UTC)
Message-ID: <fdce3c08-a3cb-4d5b-ad1a-0eeb8761778f@collabora.com>
Date: Thu, 9 May 2024 14:39:36 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: leds: mark label as depected to match
 description
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Frank Wunderlich <linux@fw-web.de>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240509110545.49889-1-linux@fw-web.de>
 <c461b4cb-2f14-4793-a967-bf08e2b4ab88@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <c461b4cb-2f14-4793-a967-bf08e2b4ab88@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/05/24 13:46, Krzysztof Kozlowski ha scritto:
> On 09/05/2024 13:05, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files.de>
>>
>> The description for property 'label' describes it as deprected, so
> 
> Typos here and in subject.
> 
> 
>> add a option to mark it like that. Future devicetrees should use
>> function and color properties.
>>
>> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Fixes: 24a71afe05a8 ("dt-bindings: leds: Convert common LED binding to schema")
> 
> Nooo, that's not a fix.
> 
> I don't think there was conclusion to make it deprecated on last attempt:
> 
> https://lore.kernel.org/all/20221122111124.6828-1-cniedermaier@dh-electronics.com/
> 

It's not a fix, agreed.

But that property being deprecated deserves to be marked as deprecated, anyway.
Otherwise the documentation shouldn't say in words that it is such.

Cheers,
Angelo


