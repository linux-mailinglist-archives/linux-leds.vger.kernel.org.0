Return-Path: <linux-leds+bounces-2314-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D73FF93BF9B
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 12:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92A442834C2
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 10:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90A6197A9B;
	Thu, 25 Jul 2024 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0EqlOvp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABD81386C0;
	Thu, 25 Jul 2024 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901927; cv=none; b=mmndZVtkahIcqx3/RtTpvi00ZOXttty2+6rnoSHj4wC5j46nojGBwAhp4ipL+3AdLn9vMPA09fKSgyZ24E18siaim43wvi+557yJnosH0zp/z8izYpVolq4VsMBzUBlR5ZtETnbt0tIwnpImKaTA8n65XvK2VJFV/6D09vtLKgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901927; c=relaxed/simple;
	bh=IXZaUKEFxcAjDCalBrfAM3gF4uWGjMYjbdac2JgWr6U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RkOndtzRRk+MlTPrJmCGMmH+X6wEvQdLKt2gkqxw0jl3+V0iwJicwdCAtcmTUG5N7jCGTzLo4QXM1RB7t1l06HFho5LWGgpgWgeo88FJtPJShGyN+bSkSSl3HiAFCo2OzHdjAzLWHJOq0SkNuz1ZspRFEiYF5i9EkSbhVjfiwa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0EqlOvp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A77C116B1;
	Thu, 25 Jul 2024 10:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721901927;
	bh=IXZaUKEFxcAjDCalBrfAM3gF4uWGjMYjbdac2JgWr6U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=u0EqlOvpZZWF+abqTuQx8I8MFmrfcaxBijsT8yiJsHjL/bXmAqJdKWebQ9vROBj09
	 4qdYFjVJmukByM/GtFUOxo3bsJqW1YS2sY59As+K5tqwrm70+9Q7tVTegjO0tx/WAu
	 iSQpfpMSXkQT4G7s6hE6Uh+tcmaMmWs0hyQo6a0P34SbjWVCX7mCZR26o/gMmQg3iI
	 fmxy56WF7OV8Pahajmx06fRg7ijH304Mbafj5yWnNV4agsROhBmeuJGkiO64KY3//v
	 1b7E+D7CR7ZQHGMjJkVTA89dGLeXuJfYXch0WnLe+Wbv3W3Ur75Gd08+kzTdlp7mv+
	 oXQ+w5mvIf9+w==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <ZpKM3yYKJixnRabP@standask-GA-A55M-S2HP>
References: <ZpKM3yYKJixnRabP@standask-GA-A55M-S2HP>
Subject: Re: (subset) [PATCH] dt-bindings: leds: sc2731-bltc: convert to
 YAML
Message-Id: <172190192475.914923.1826411218359882858.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 11:05:24 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sat, 13 Jul 2024 16:19:11 +0200, Stanislav Jakubek wrote:
> Convert the Spreadtrum SC2731 breathing light controller bindings
> to DT schema. Adjust filename to match compatible.
> 
> 

Applied, thanks!

[1/1] dt-bindings: leds: sc2731-bltc: convert to YAML
      commit: 1b8684a0f19e2d8498501d17f2e0b590d5e4cfe8

--
Lee Jones [李琼斯]


