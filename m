Return-Path: <linux-leds+bounces-4401-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0078A7BFC7
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 16:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B6F417B1E8
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 14:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF1A1F4189;
	Fri,  4 Apr 2025 14:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCwxTY91"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346DC77111;
	Fri,  4 Apr 2025 14:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777919; cv=none; b=Y8iKjQOQUzC9Pvhu+1vNYCErcKV0A1dbQd6erOYsgl7ZmAXPCqJYAVUEdfA4DQgkY7QF5SvaoFiftrjR0K7TZX/RR6zHGX+fLDinZocBhe+/Dro7dtZA+BrU3cLKSBSUchm8GW81wXGfrdlRs89HPZEfqdPrtOppK35EDNvVyO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777919; c=relaxed/simple;
	bh=QksyQbE+08Iq66gHvsGEsvjyWfi3Ado+GfSgaflv5T4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FSxlp+psZ+TRvEFdH4go0q4lXiewvOwFFYGtKwNWXUXWx53E+o/whXnfiUYVsRIV6tcBK1hF7AU7t8nueRLFxJrIRPauTsxJvEZH85woi1l9k8jQfAXDDx1u/g2xbgtJGGuQsLP/SmY5DrHiCKq/5M1HOQ7Qt3pQ8lGgeI/D+co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCwxTY91; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5E5C4CEDD;
	Fri,  4 Apr 2025 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743777918;
	bh=QksyQbE+08Iq66gHvsGEsvjyWfi3Ado+GfSgaflv5T4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QCwxTY91Ihufe1nFDIVmN0Bh9qG/T1QKgEhv0owcyRB/WI3KcD8x1DxeWnV9fo7wo
	 H/cm3A8QjVd9Rq18WntQSfye0Y4Lb9VqXpkm3vdpagnuVpH/cD+PNpc2nT7TfQG7Ou
	 UXPr7MjizYCJSMvS1DAq9p/okOlsRvJOb5xiI71JApGJzfQV7eJTH7kqh+/i6nOhii
	 QY5Wdggze6qxyt7jpYGfTiAzHao935iiR3dxQYT09oCv5TKFcJ3JnLNn8Lbb1zXqJ4
	 ++8ThVX2Z1tUNvij7bLUMs3RMS79szyevYPX1qE4PplP6MLx7hwfjggF9T6wlUDij+
	 0rurFzrk2FQmA==
From: Lee Jones <lee@kernel.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <Z-rKcgFjsyKvd58q@kspp>
References: <Z-rKcgFjsyKvd58q@kspp>
Subject: Re: (subset) [PATCH v2][next] leds: Avoid
 -Wflex-array-member-not-at-end warning
Message-Id: <174377791657.384039.15622811983419116950.b4-ty@kernel.org>
Date: Fri, 04 Apr 2025 15:45:16 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Mon, 31 Mar 2025 11:01:38 -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Replace an on-stack definition of a flexible structure with a call
> to utility function cros_ec_cmd().
> 
> So, with these changes, fix the following warning:
> 
> [...]

Applied, thanks!

[1/1] leds: Avoid -Wflex-array-member-not-at-end warning
      commit: c0adca7285b2bdf2ef7a67bb02e282d861e7b6a8

--
Lee Jones [李琼斯]


