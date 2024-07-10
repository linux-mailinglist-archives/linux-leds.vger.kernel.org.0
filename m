Return-Path: <linux-leds+bounces-2234-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DCD92D176
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 14:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 454851F2608F
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jul 2024 12:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34502190694;
	Wed, 10 Jul 2024 12:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="QjCtRgHn"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A20A4DA13;
	Wed, 10 Jul 2024 12:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720614093; cv=none; b=Ex4HbyIe7metYZpemW4f4quEZox4XGyuHVM4tO41w6TJt4H96+ULEjO33V0lRu+QiKjFvV5H13Y/JdT/lYI4BED0Q/i4CfhU6sf5n5zlfD4TcjSmv1wCLgCEnLH9HI3IwP63XbdBQWe9FOEA4YAzKh0n8Qqhw4AMY5rS0JC9VrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720614093; c=relaxed/simple;
	bh=6mXeSV/VujQpY2hxV1zzrEsAluB/ouP9A5Emk8cUf9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QrpYIfBZ41wS2hjGTxRIZ8MGUdjdhbrZ9LS7TjUQNd6n6OVx5JF/xZHm13wD1RZdom41LvlaW0NMVGIbn7rZtPjvfxS3vqeB1iMQcLetoKvMVEwLSQahbjRz1ndJa4KuN6qD6o4PuzlLW8fDyywDjcXBEZscG/J9Pbd4Ym6RuRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=QjCtRgHn; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1FFCF88657;
	Wed, 10 Jul 2024 14:21:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720614089;
	bh=8c8kdQb0SV1N6d4jQOz1fJz1X1dfdcC9CGIucy4HoYc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QjCtRgHnxA0ys2D1sFf8/q7rabzVGBmMgiz4zc7ZV5xxoj2clqy+E9vgaGtKbWRJL
	 SXtSoJm+bynufaPl1TC+hXUeufY+lVq0oUOO6Zn3IKzVl9PYetLfToEKj9GIoRYdcg
	 baYrAvQtkxCE26YI0R2Q+qYRcXzIKXVPBkCPZeyxqUqYOiezNtyT1lCOgJitNWPg4Q
	 rIFA+d5PXTxeyku41tYLSuAXYCSR7zaRC0QPmGI7BbPIoZGGkoe1LSSIUu/UrnMsPt
	 HibzWJBOa/TmegXAK3sl2poIeMnDdGl6fOMHfSHPOwh+OjqlPqgZ5makKWhtl/c5KN
	 AgI6duHU2uxVQ==
Message-ID: <7b2840ef-7ddb-4e37-9b00-18b8bc50d392@denx.de>
Date: Wed, 10 Jul 2024 13:55:35 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: leds: pca995x: Add new nxp,pca9956b
 compatible
To: pieterjanca@gmail.com, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Isai Gaspar <isaiezequiel.gaspar@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240710-pca995x-v1-0-545015603000@gmail.com>
 <20240710-pca995x-v1-1-545015603000@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240710-pca995x-v1-1-545015603000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/10/24 8:15 AM, Pieterjan Camerlynck via B4 Relay wrote:
> From: Pieterjan Camerlynck <pieterjanca@gmail.com>
> 
> Add nxp,pca9956b compatible, which has 24 instead of 16 outputs. Adjust
> the documentation for the difference.

Reviewed-by: Marek Vasut <marex@denx.de>

