Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33D5A2759C3
	for <lists+linux-leds@lfdr.de>; Wed, 23 Sep 2020 16:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgIWOSy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Sep 2020 10:18:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:58092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgIWOSy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 23 Sep 2020 10:18:54 -0400
Received: from dellmb.labs.office.nic.cz (nat-1.nic.cz [217.31.205.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3D9921D43;
        Wed, 23 Sep 2020 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600870733;
        bh=63pzL52BuKoPTueMiUQfMC6VAD74d2VbT76DZ6fShzY=;
        h=From:To:Cc:Subject:Date:From;
        b=aKrFaOY1QgpKgN3pFTFmbYq1Hvt9PMUpjK0AvGIVpMZ6tobnTa58ESYjOPvI8/B24
         AjZhmdbiT33PZUtGAi3g+dagn0CrQInXObESDzAFWZgjSFH55czj66da8nQB4CjObU
         Doc8CFSF0HcGhdMXV6n7L0sqZ+L3zgV0SHLppTts=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, dmurphy@ti.com,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Simon Guinot <simon.guinot@sequanux.org>
Subject: [PATCH leds 0/2] leds: ns2: convert to fwnode API
Date:   Wed, 23 Sep 2020 16:18:38 +0200
Message-Id: <20200923141840.6333-1-kabel@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

Simon wants to bind this driver without device-tree, so this changes
the binding from specific OF API to generic fwnode API.

This applies to your for-next, but if you apply this, I will have to
respin my other series moving parsing of `linux,default-trigger` to
LED core.

Marek

Cc: Simon Guinot <simon.guinot@sequanux.org>

Marek Behún (2):
  leds: ns2: convert to fwnode API
  leds: ns2: do not guard OF match pointer with of_match_ptr

 drivers/leds/leds-ns2.c | 74 ++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 38 deletions(-)

-- 
2.26.2

