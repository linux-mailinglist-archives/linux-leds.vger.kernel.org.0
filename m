Return-Path: <linux-leds+bounces-4648-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE9AAB80C8
	for <lists+linux-leds@lfdr.de>; Thu, 15 May 2025 10:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3C1B18911B6
	for <lists+linux-leds@lfdr.de>; Thu, 15 May 2025 08:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE8B2882AD;
	Thu, 15 May 2025 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSC/ZRd2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE5C20311;
	Thu, 15 May 2025 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297772; cv=none; b=d6JnvEAk9mOzdahfsboh3I1i15q/C939WKhn6E6aPRa4CIG78OIOHDPS2WTQt+5woYKPWFrn55BjhGx4mgEQ5TDXXcRW+8yo574b6RJ0hX8K/eKt2EKGmFqVE0eV5sUFkXyE9Ft5j9P/fiQeF0ygMAWHnWapuwtFXertnAswCPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297772; c=relaxed/simple;
	bh=FGejzD/LurepsaH++0PFVuF59zo3Xu8mTkDCmNBX/tw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ILGMS5F32XVHx0Kkf0A94PjDhAiDlg7avGvm0AuzYDv84dfQlhM61hunKLN/gBaBg3+idwXVRH1p1ZsWqeZ1ubjHmSyKcXYOvAZysVlN+4QLUYK89QYknaqqLZkGp2BSXOWNWZX79bAC8cTxfW4wEOJxQIIhN0kPjPO71Mg4tM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSC/ZRd2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E503EC4CEE7;
	Thu, 15 May 2025 08:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747297771;
	bh=FGejzD/LurepsaH++0PFVuF59zo3Xu8mTkDCmNBX/tw=;
	h=From:To:Cc:Subject:Date:From;
	b=dSC/ZRd2ehVNAUwTHkv1Nbx21NXYlu35hFtAv6Q9xVjrNnGU5rkT6JEl3mfi/y2/O
	 Nfi/ekZXnOhFaIgxG9ZnV9ZGWFWnI3w7WQ9vIW668GyYiFS6eroTVeBy9Au/3ASnS7
	 SNCMjrdSNbCnVqZXyn7NM8F+zDROTTcDwCKH6wpP+hsB2/B1FkCxXJDK5Fi8VIlXY+
	 LnJDOdjmhYSWy9pRy7A2ACqUBDMf6p1pz6KErkhsrqCSV3LEJqOd+mo0p6iOTQWzzn
	 aiHXyoF1Pn7+h84jFiM0Wh0WYbv0GkwV2qjBSBmjM8NONAXJqKGZxiEFI9ss2PUNr5
	 QG1GMSXw+207A==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com
Subject: [PATCH v2 0/5] leds: KUnit registration tests pertaining to init_data
Date: Thu, 15 May 2025 09:27:59 +0100
Message-ID: <20250515082830.800798-1-lee@kernel.org>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lots of drivers still register with the LED Class using init_data. Let's
provide some additional Kunit infrastructure to exercise the various
possibilities.

Change log:

v1 => v2:
 - Use devm_* to ensure resources are cleaned-up on exit

Lee Jones (5):
  leds: led-test: Move common LED class registration code into helper
    function
  leds: led-test: Provide test for registration with missing
    default_label
  leds: led-test: Provide test for registration with missing devicename
  leds: led-test: Provide test for registration with a name that is too
    long
  leds: led-test: Provide test for successful registration using
    init_data

 drivers/leds/led-test.c | 86 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 80 insertions(+), 6 deletions(-)

-- 
2.49.0.1101.gccaa498523-goog


