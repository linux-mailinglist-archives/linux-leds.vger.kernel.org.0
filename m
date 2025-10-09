Return-Path: <linux-leds+bounces-5692-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7652CBC8F13
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 14:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36360420340
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 12:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90A32C3274;
	Thu,  9 Oct 2025 12:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOT6AYbH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5FE2C0279;
	Thu,  9 Oct 2025 12:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760011462; cv=none; b=hP8ayXChWajyEgjPrHERWyHTVFMR/+9nXWyGpksBLzzyoIfh/KTstkHpTi0EE0DKxhLR9bCN0JDtFxfOoNxJCeGYANWXorc2PWmrC9kangpOEq96KAicBMin2Edf/WcuYdnFNopUVaY4d+cZlK/XeJQXmfR9gb8XRFVKkyxqLQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760011462; c=relaxed/simple;
	bh=mUm9a7u1ihBXgDdOJmtbhRpw4PNkcXoZd5xz425rLz0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J93vZSJyo5/JIXF4CdcgFfTWOiuqV51JFuVve8/+XzfLW/b2/4blfy2nDq6goCDHNTC8ZuCVfSa5cA6ACa900p9kTzsJeFJQJfdJwImE+hSlOl+S6T3yEzyh5vFTy2OJKp071t0iN2elRcO1YMGP1h/fblQPelgRlf6528DHPyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOT6AYbH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0E0C4CEE7;
	Thu,  9 Oct 2025 12:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760011462;
	bh=mUm9a7u1ihBXgDdOJmtbhRpw4PNkcXoZd5xz425rLz0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oOT6AYbHX2NtOYJGdpPMlp2RVHRO4tO7z4QfX8N5WVR2meCB/v4qodBsOm7M8JpZu
	 IpsKsPzLAbbIkuSZPI6tMsJXhlGCVW6XeP0lkpGOZGUi4bhXBi+ZXTt3lGQLZm0lHJ
	 Zpfh7Fy/mvT4bPlG7v6A9/06xCCC4X3iTYJTvRDJELQu6yZHfSaS00kT6wKAjX8aZI
	 TxwJ257QoLa+oueX5odcDScZ2aFCLmPEqpemH3Navje0Dsi9wRfBeH8Foavqtuwz5X
	 9Xg+5vFemCYw/VNoSE/8OiFxlQoe4LWlJNsO//HQ1NVvSugjDqfk+e/HswJGCcmE1m
	 42Ik9LZk57HEw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Dodge <bdodge@arcticsand.com>, 
 Harrison Carter <hcarter@thegoodpenguin.co.uk>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250925-arctic-sand-v1-1-735b5ed8faed@thegoodpenguin.co.uk>
References: <20250925-arctic-sand-v1-1-735b5ed8faed@thegoodpenguin.co.uk>
Subject: Re: (subset) [PATCH] dt-bindings: leds: arc,arc2c0608: Convert to
 DT Schema
Message-Id: <176001145951.2795757.17961348226563861071.b4-ty@kernel.org>
Date: Thu, 09 Oct 2025 13:04:19 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b87af

On Thu, 25 Sep 2025 14:57:58 +0100, Harrison Carter wrote:
> Convert the ArcticSand arc2c0608 LED driver to the dt-schema.
> 
> 

Applied, thanks!

[1/1] dt-bindings: leds: arc,arc2c0608: Convert to DT Schema
      commit: 24482f2410428ca39d74f92deee38db2c2c6faf3

--
Lee Jones [李琼斯]


