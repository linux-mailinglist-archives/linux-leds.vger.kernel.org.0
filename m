Return-Path: <linux-leds+bounces-1733-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B74218D5FF7
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 12:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54BE61F23BCC
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 10:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529B8156C7B;
	Fri, 31 May 2024 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UF/4zd7t"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27719156C61;
	Fri, 31 May 2024 10:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717152574; cv=none; b=QDfc1X38PBG9cSVMXTfyvUCrE0zZUSyuxOJhzbhAObSPR4Ur4aMP2W+mseQEC9xmi7IKc1puv3N8Xx54sJJO+IzoTeOwNsCS3xpjgcNj+5+zwzID8ff973prDEkJ5xeNZvF9+z70CSB34RNIvjv7kXHHtBOL9lAnAUO6nrKywGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717152574; c=relaxed/simple;
	bh=RvBI/DO9eI7WJD7WUndKZjDzo6+ZcDcOvUjOEa8Tnzw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NKQT7meb0fdI6R7RvvELPKlCLcHGAV6WypSpAjtz5/sSEkYoqNKqWgWXKa85KQloWoqQZFcYld/OZIsA4Ux43OZ0Fp/W0VOAFTCishrgTxCaZXMrqZm4kyEjYNOI5E+7vk+Uy05kiPWWXcnn7V4ylUOeJNmJ04YNj1q6tf5vRSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UF/4zd7t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC192C32781;
	Fri, 31 May 2024 10:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717152573;
	bh=RvBI/DO9eI7WJD7WUndKZjDzo6+ZcDcOvUjOEa8Tnzw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UF/4zd7tDRqAnkqB4mox8pqpiNxLtNqV2OCAxS3m5sS+pZdDQoTrxqHwesjHWKaii
	 fhFThejrqVg5XifCo2evMjzjl9ln237v277kDY9wltWD2WZWEMns66eqOMb7rZFhVk
	 RHZDH7yepUjufwRY7gWQ5PvHbicQZZUjcyZaJ5q4NY+rHAtHbVEjNqD6HP3W9ZYJ6W
	 MG+inZfHvYp/0/sgmEsKaBhofAxkRDfMOS7PA5KzwDwrfvkwcDmPR8GLmIzThpvoEr
	 vC8NzkVpCpAutNq+lvdRkN/r5bMF7q+sMWXIZWfF5W/og50i1WtpCLM/73YA5qrawY
	 dBdUwm3R+TOyg==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aryabhatta Dey <aryabhattadey35@gmail.com>
Cc: pavel@ucw.cz, lee@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
 javier.carrasco.cruz@gmail.com
In-Reply-To: <qpnx2m6qo5abvbs65o452gicumxa7n5vnw42e3hxnnm7sou4xn@fvu52tilzujc>
References: <qpnx2m6qo5abvbs65o452gicumxa7n5vnw42e3hxnnm7sou4xn@fvu52tilzujc>
Subject: Re: (subset) [PATCH] docs: leds: fix typo in
 Documentation/leds/leds-blinkm.rst
Message-Id: <171715257148.1033112.3919908889836604698.b4-ty@kernel.org>
Date: Fri, 31 May 2024 11:49:31 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Wed, 08 May 2024 01:37:11 +0530, Aryabhatta Dey wrote:
> Change 'dasy-chain' to 'daisy-chain'.
> 
> 

Applied, thanks!

[1/1] docs: leds: fix typo in Documentation/leds/leds-blinkm.rst
      commit: 4324f97613d35ab3c1a3566ee4f29d863ba5f285

--
Lee Jones [李琼斯]


