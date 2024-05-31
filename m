Return-Path: <linux-leds+bounces-1771-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2168D651D
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 17:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1297E1C22712
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 15:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2662B6BFD5;
	Fri, 31 May 2024 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDKF8ibz"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA5E7483;
	Fri, 31 May 2024 15:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717167939; cv=none; b=XQ61WCNaCKpWdeaGR9/y/yFtTFczRUV6krZwujh95KBSzdURnsOc0Zx4UXEtHdf2e53AnE+8uiTUSvoYGoncN6kuZtsSpmZKozRN3xA9Ilf6TNLmGsBZji8ZyyJyk7Jar7V9xzwoXBDm+WA+6oOZkp2yMyVeff5co52zzQVgOGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717167939; c=relaxed/simple;
	bh=V4IL9FSiAAaLAbgQkaH0wiehW1wHmmkNYh1G0Mg9i/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CWcF/jN8aN9GIViM9MH/yJvPuPqFXcKxtRcRiZs8tF1iYA/sq4mofuf5ntdU+cwtX01JxVxyaE5PTmJNQiFNwrwXmUYhJhnGSCDvutmiaS4Bw7n09AhXCRGWFE5u3w838HiBzciwZzNOwTGK8XkLDlcChWocrQCtqSMizAMAvbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDKF8ibz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FB5C116B1;
	Fri, 31 May 2024 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717167938;
	bh=V4IL9FSiAAaLAbgQkaH0wiehW1wHmmkNYh1G0Mg9i/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FDKF8ibzRSbpSFndvIT0WdMV2FWGLP7O+n6psQ4tzFDDZ981mSapldkAF0l85vKwc
	 r3FSfVhUbjS9Tt8cVSFTGbPLd2Y9Jco7o1z4ZQrDSV6lBz/m7KsLwTOUW1urzW/9pw
	 qeX2rUIps6B8eG6IL7SnoxON0XeUodaY0h3kCL1WLknvRqj5eSN6BtsmjTRZX/Whqw
	 HoDqHAE1/4dx9C53QWXpp7Pv7HpZwWwRtbd384kcC5OKsbK+FQ/6zCumWblMS2b6uO
	 skiZqpOzdKucUb8Sa6klbupI+XoaPY/lsC8UPqREObXg2F7k5fsMzWIk2wM86x8l4T
	 ENYrB6qrir6Gg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Dave Hansen <dave@sr71.net>, Richard Purdie <rpurdie@linux.intel.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20240527132700.14260-1-ilpo.jarvinen@linux.intel.com>
References: <20240527132700.14260-1-ilpo.jarvinen@linux.intel.com>
Subject: Re: (subset) [PATCH 1/1] leds: ss4200: Convert PCIBIOS_* return
 codes to errnos
Message-Id: <171716793655.1148553.64082330680622077.b4-ty@kernel.org>
Date: Fri, 31 May 2024 16:05:36 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Mon, 27 May 2024 16:27:00 +0300, Ilpo Järvinen wrote:
> ich7_lpc_probe() uses pci_read_config_dword() that returns PCIBIOS_*
> codes. The error handling code assumes incorrectly it's a normal errno
> and checks for < 0. The return code is returned from the probe function
> as is but probe functions should return normal errnos.
> 
> Remove < 0 from the check and convert PCIBIOS_* returns code using
> pcibios_err_to_errno() into normal errno before returning it.
> 
> [...]

Applied, thanks!

[1/1] leds: ss4200: Convert PCIBIOS_* return codes to errnos
      commit: c1f69631a8f438997621c9ff322452b744525048

--
Lee Jones [李琼斯]


