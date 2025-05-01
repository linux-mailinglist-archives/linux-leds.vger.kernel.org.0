Return-Path: <linux-leds+bounces-4567-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F351AA5C06
	for <lists+linux-leds@lfdr.de>; Thu,  1 May 2025 10:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3FAA463E47
	for <lists+linux-leds@lfdr.de>; Thu,  1 May 2025 08:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89B41DE8B4;
	Thu,  1 May 2025 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijsjpsQa"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE84C1411DE;
	Thu,  1 May 2025 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087568; cv=none; b=JX1iiSDHI4DfrY/FpKSUPuy4NmDj0BuVjwoOpnvpEORA4jcw7PIzXlYskUlCwWfmjXH55/++7pD7LwmWonw4Pv4tgJYIx70y2tPfi7ZTfT9/e+pN8H8+NMbWjNyBkMsRJFaMUWlzPsUKOX29KXtB7EdNwIn7BN6VB8IuTM3UWaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087568; c=relaxed/simple;
	bh=nsILDRc0lseFd1tlQC6e7X/eWY6LuFYiZUFOmwhwPYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hx4sGZc9Cf1CbFbsDoNI7bJ8rOxGhKTTTAbdhvvys+0tnZP/mLBRPjRtJwJcHG12FuhNAkonJ5xCAbWkecKL5mOiAyqsLz4hYrAFKWskZKtuGYVbJ2OJF0iW044mNI230SnO0lSJBXZqYAMCxGCsj4cb10doDrEV0RTqwf5Ck0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijsjpsQa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC08C4CEE3;
	Thu,  1 May 2025 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746087568;
	bh=nsILDRc0lseFd1tlQC6e7X/eWY6LuFYiZUFOmwhwPYE=;
	h=From:To:Cc:Subject:Date:From;
	b=ijsjpsQa9nUP09i3NbUmko8kELXkwW6d9SJiLSpNUXPUYsHYqsINtbFuSCVKl+R9R
	 /4D23oAObhilbCbnah9nycKPdp0BUQj3ydJnWJ2n+Q9mJ4ztNxH5SopBxx4MB99gqm
	 vlTYwGLT26LyH3N57k398jsxW1w2Jbqh+tsxYT6fa/6q3mvNZI8psXxXyzBLLTj/mN
	 bRwKUZektBBG1Pr8hsNj718tXNaEote2dnkgv+XEBagNrEiW2Xbq57AW8Jaz3k/PHU
	 i8rCQTSwSFcds8QBegQzK9o6OHjMupejjvClocFDCnIlyFVVQi45bvIwwlAneXqaeO
	 rjvU7pAtKgQMQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bettyzhou@google.com,
	ynaffit@google.com,
	tkjos@google.com,
	jacek.anaszewski@gmail.com
Subject: [PATCH 1/3] led: led-test: Remove standard error checking after KUNIT_ASSERT_*()
Date: Thu,  1 May 2025 09:19:11 +0100
Message-ID: <20250501081918.3621432-1-lee@kernel.org>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a KUNIT_ASSERT_*() call ends up in an assertion, the test is marked
as a failure and the subsequent error checking is never executed, making
it superfluous.  Remove it for simplicity and to avoid confusion.

Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/leds/led-test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/led-test.c b/drivers/leds/led-test.c
index 068c9d0eb683..23820189abe3 100644
--- a/drivers/leds/led-test.c
+++ b/drivers/leds/led-test.c
@@ -26,8 +26,6 @@ static void led_test_class_register(struct kunit *test)
 
 	ret = devm_led_classdev_register(dev, cdev);
 	KUNIT_ASSERT_EQ(test, ret, 0);
-	if (ret)
-		return;
 }
 
 static struct kunit_case led_test_cases[] = {
-- 
2.49.0.906.g1f30a19c02-goog


