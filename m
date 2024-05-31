Return-Path: <linux-leds+bounces-1748-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC7F8D61FE
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 14:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A55D287AEA
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 12:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2F7158865;
	Fri, 31 May 2024 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mScuumZN"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271361586F6
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 12:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717159139; cv=none; b=doGRTQxHWKGnfee8ar6tikEtD/M4tScJiSqrV4y7PTQCY67IUeVvtrveLBztfbOLMPP3rVJA/pLr0wLZraoy041qz7n23eC84pF+PZqUvXl/TSu8C1CJ+60283BwXPVZTL+CgSh4V3nzlDffjzY6AstV4NqV3ZOWkEeVubWhe9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717159139; c=relaxed/simple;
	bh=UmkBw3sq7fb73+qhDXwO3KIYm8AosxsIRGHDAQOhn08=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hpAvyvBRxPPMVe8jPZn1Sd9UXvoMpTCy9Mj5GLwodhDdMWPUtA2p1Iq6anuSI8GGmpWNkynYTPu78brIrdKg/F8SO45ChTZcJjs5XuIcJqxl3+6Z923COqL9R4SpTQDfJsFK7qwfagNrKusXGjOzBUHL7DiczT/sIgPcSgKW8E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mScuumZN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9687BC4AF08;
	Fri, 31 May 2024 12:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717159138;
	bh=UmkBw3sq7fb73+qhDXwO3KIYm8AosxsIRGHDAQOhn08=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mScuumZNcYYN2T7qPtQj0edYPwP+8HDXAYzXN/oKy4cKIANZuqZBZyxX6PWI5gDFn
	 w05IIo2VZaBb/uVCvTO8KaIyAhcKmi4S/JKcqpoE4TB92ZxbY9ZWJ9GMlXKsGFHOOJ
	 sN+o/pBOeSOyWCIclZmNZTLL0sOYnaHnpkx7zEEYrKGFIBenfAr4aL3sV1bx8tQHnS
	 1u1AMfnzvjeNt/8Igey4yv2BkMAWMpAmrXRp+bSZvoqRkLnRNO5+quJdM1l4NcPMSg
	 hsXNfTdGTXbRQVdrqSHPg2bBRUgNTltWL/onkwvitZZn9eKoBolefDKP3OpXP5bAov
	 srVdMxzoRYalA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: Kate Hsuan <hpa@redhat.com>, linux-leds@vger.kernel.org
In-Reply-To: <20240531120124.75662-1-hdegoede@redhat.com>
References: <20240531120124.75662-1-hdegoede@redhat.com>
Subject: Re: (subset) [PATCH v2] leds: trigger: Call synchronize_rcu()
 before calling trig->activate()
Message-Id: <171715913731.1067749.8025287742562357636.b4-ty@kernel.org>
Date: Fri, 31 May 2024 13:38:57 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Fri, 31 May 2024 14:01:24 +0200, Hans de Goede wrote:
> Some triggers call led_trigger_event() from their activate() callback
> to initialize the brightness of the LED for which the trigger is being
> activated.
> 
> In order for the LED's initial state to be set correctly this requires that
> the led_trigger_event() call uses the new version of trigger->led_cdevs,
> which has the new LED.
> 
> [...]

Applied, thanks!

[1/1] leds: trigger: Call synchronize_rcu() before calling trig->activate()
      commit: 47b8a4059f8a8b2407ab22fad8775842c54e59c6

--
Lee Jones [李琼斯]


