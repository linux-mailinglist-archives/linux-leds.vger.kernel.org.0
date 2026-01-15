Return-Path: <linux-leds+bounces-6649-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F2DD25393
	for <lists+linux-leds@lfdr.de>; Thu, 15 Jan 2026 16:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 921B43003B09
	for <lists+linux-leds@lfdr.de>; Thu, 15 Jan 2026 15:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85483AE6E2;
	Thu, 15 Jan 2026 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3jVz017"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61173ACEE2;
	Thu, 15 Jan 2026 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768490062; cv=none; b=AIlbH2D3NRMBvxaFG4p4nk6Fhf/1ilJp1aPRbJ7qlzMeEzXttZXp+VeLn8f6lqaAwwEsKLrCffqnbOkW9wwdYQXv3Ub111TEyt1sYNZMRVlcr9sgM6mbUV6JX4oY9cTCTpupD4B0O36mALGOlFzzGfaKaQ5AFpIYuwgv7ibm4SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768490062; c=relaxed/simple;
	bh=KlJS7yWzDPntAj1shRRl81usLthEKoFEFO2HzEY27Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbZ1MyrcHJYgcj6jN0Myd4NbOhC/rfTorQ8nIh1Wyu99co3Pb8lWHr0LgT/gFWbFcVQgJ4Q7LsbFaQFfmaBz1UnsO4uVnG6fQd3FdfbNasvDhO8x0LJ+w5srRMmp/UDbay1GjtcWkd5IWn7KCJ3RiTOhk/uHI5Ja0/fT8r/dlB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3jVz017; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58320C16AAE;
	Thu, 15 Jan 2026 15:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768490062;
	bh=KlJS7yWzDPntAj1shRRl81usLthEKoFEFO2HzEY27Cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g3jVz017r3HjqhJCKdPOFCFYJjbcMIjlP8+4yuFicYPjCQG+yz3Lf4XI0YBHy+jtK
	 5PZk901fFBfegHw0SpkhOTN7GSwyh9TfFG1yK7PJoMxzOUSsqrqDOjjzXKsHr11/KR
	 sFPiPPbCd1oUtI1SxaxteydCJ4qYNXqXslUPN8+JuQjy3BmwoyQigl11/RjEo5ZvDC
	 UAaINvBCQdGnfSF4JpVHRn2Gf2q4NqarN+8wPqFvZMEeMJDM2hC6UvN2js4Mst7Xvx
	 mEaROrk9b58EMVV61KGPUHM9+Vvbi0+6wkqAUn2gNqfk0fW/bSo/qV8K45nni4JaRr
	 vQEiptuwvwtwA==
Date: Thu, 15 Jan 2026 15:14:16 +0000
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: gregkh@linuxfoundation.org, pavel@kernel.org, rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v21 0/3] leds: add new LED driver for TI LP5812
Message-ID: <20260115151416.GG2842980@google.com>
References: <20260113124053.GA2842980@google.com>
 <20260113132247.36012-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113132247.36012-1-trannamatk@gmail.com>

On Tue, 13 Jan 2026, Nam Tran wrote:

> On Tue, 13 Jan 2026, Lee Jones wrote:
> 
> > On Sun, 11 Jan 2026, Nam Tran wrote:
> > 
> > > This patch series adds initial support for the TI LP5812,
> > > a 4x3 matrix RGB LED driver with autonomous engine control.
> > > This version provides a minimal, clean implementation focused
> > > on core functionality only. The goal is to upstream a solid
> > > foundation, with the expectation that additional features can
> > > be added incrementally in future patches.
> > > 
> > > The driver integrates with the LED multicolor framework and
> > > supports a set of basic sysfs interfaces for LED control and
> > > chip management.
> > > 
> > > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > 
> > Still does not apply - which branch did you rebase this to?
> 
> I rebased this set onto linux-next, specifically:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git (master).
> 
> Please let me know if you would prefer it rebased onto a different branch.

-next should work, so not sure what's going on there.

Try this branch instead then:

  https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/log/?h=for-leds-next

-- 
Lee Jones [李琼斯]

