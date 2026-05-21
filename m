Return-Path: <linux-leds+bounces-8268-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOl0HGKpDmr6AwYAu9opvQ
	(envelope-from <linux-leds+bounces-8268-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 08:42:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ECF59F91D
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 08:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9FD8301A3A4
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 06:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5782437F8A3;
	Thu, 21 May 2026 06:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIWxMM5p"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBD8367299
	for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 06:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779345477; cv=none; b=dirLRWfL3fkW89Xr5BxW8ByO0TlELJzV/xOXBGUT3DB+1DSle3W0f6QAS4FlA0wXXVwunECGC8tuLRAENGcLwQCtJ6FCkUIk8kyMj7X51F3dshPh9jDEDT4Tmgb4Y1LT6WXPHNHVE3hVAR8sW5b12jGYDyRzN0+iKBRkiJ0DZok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779345477; c=relaxed/simple;
	bh=VWLyWjm04DTUYpJ7WWsU16IGC2+D6aXWyvh9X27bStA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VW0jZaCWBUtPFlsBC8UeBpE/YFxZvBNARatnDuHpgCFAcYHgYmjaa3UgYEkN/jeFSAnmZKtrOFAnj/LPDqL7Oww1yjbVGkwsDSsO3NwwTI4tTJQNELOEz3lDOgVHIsq1VHarzk5g1Y6e4K40oru8z93ucdEfUui51/nH4RRevl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIWxMM5p; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso42273645e9.2
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 23:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779345473; x=1779950273; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ahhx+Q7bAbhezZQFMJmiRABaqwf0Ndg5KLiWrpMPDr4=;
        b=GIWxMM5phYRSH0uGzT/8Mj7AGrE1hFRKLqIcAS+0CqtfQZBJiR4cZQ1Noonj4hwCvL
         vofRKvoCc/7l1TrC9GEYg1GGrr+7TFWTKWuwkbaDpSsvNDJqvfge1uq3VvctkFL011/z
         1eSfCxB1Uk762b39JD9nu/ZXvh8B/uDHuwVTU57TjUMZvk0GJwlLvg3UHb1JWndsqS3w
         Ow20i4LUCuIpvEZ6dM7Oz3LkOlXS1nhl1jVqhEeIwYvMKaS52F+kQOjpmtlk8nSyqtIe
         xdMSN8Ju2Ts+Mkk9HHD2+u79kL29cEaKClIMi5LhnzLfbmat/kWW4vlgcqCWsTdVxg+I
         Ia1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779345473; x=1779950273;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ahhx+Q7bAbhezZQFMJmiRABaqwf0Ndg5KLiWrpMPDr4=;
        b=QqnDh+TreLv7r0XSWTt38kCaaJf73zHmgKcgaf//cru0YfPTRN60nm3SXW3IbXQMyd
         YEnussG3uqEFjYZx7O00RDSfDjbfxXDQFHFCzFTAlZvP+kviwMl2KLGwP3l8pITlpJ99
         Wfsjab/X89FMcRoJ1RVhwqWHsKoj5jxZjCtevIVbjH7DDO6ET35oKHG9+mzt+j1nRr13
         jI8cJPwQr+Xs8R7aNp3sCkEkQeEguAZ2wKGlwONkk+wwAWS5IGRMStL267iqmg/sGFFS
         MP0/XTNcjN+XIWx4jpmFIH4YYLH+juW7xlMr1YKGHrJanLpd3f2EVFHSMinPxBmW2l8U
         RyFA==
X-Forwarded-Encrypted: i=1; AFNElJ9rdcswhKQqVGgtIRHLbvv6BFMLkkHV3T6pAHJSOcXJEWwK6IIo2V9quaTwutX8CbNrsnhbgtjtpFdx@vger.kernel.org
X-Gm-Message-State: AOJu0YzCeNyEHO+h3LLfIMJU9JJUW67VOc3vcZQMAcZdnlXtwhc5/jsW
	JeCdY8cEKJ1hjHdiwBRhrPjMxtS7xJ8txbhNfm/U87XFEy0aK4LcpCZM69B3lA==
X-Gm-Gg: Acq92OFKOX4hY0cpJC0GnJsddUvG5kwTysUf2mjtAn3HA88DhKq3Ji8OGyq8XLyv1xs
	XsWXyZeg59O5NmEXt2+CKoKfcpH3wj1Y2nNlHq0o4eaTNzTz0KNTlVyjEJQLdgORVB9J28AJTS3
	vIMcOwbF7QGSQf/k+lmOJyV/TV9vzCA0diNJttF9Tbb7K2QcrAHyOqNZfXpP5u5/DgNECAzQ8ri
	89b6BE3cEh7/uUHqNH5w8hwzLO27/Hn/4tW0j0PdaHpla3OzgUwQQL2PhhJBafjBKPFUSDd0lfs
	ur+QartBt+tS7rrqWT32D5ClMtEHu3eOsWyy9PeNbCqdF2OD5k+/oc+WKRHsOvgTwEJJHYdP41M
	rCnt5u/h60PZetzYrImiFvyz5KxuGVMb4OX39OCtUmdgcg+k4s63Vt8V17HfMetIxOJlEzYgOlF
	hP3xUesn26G0MmiLkegrZADOA=
X-Received: by 2002:a05:600c:4c27:b0:48e:6f39:f7be with SMTP id 5b1f17b1804b1-4903605f44amr10071075e9.10.1779345473371;
        Wed, 20 May 2026 23:37:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7dd9e6sm299931f8f.16.2026.05.20.23.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 23:37:52 -0700 (PDT)
Date: Thu, 21 May 2026 09:37:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 12/17]
 drivers/leds/rgb/leds-lp5860-core.c:119 lp5860_iterate_subleds() warn:
 passing zero to 'dev_err_probe'
Message-ID: <202605210624.3gcr3prk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8268-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D1ECF59F91D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   25025253476a64c186592d952c27f24bc3490e42
commit: 3daf2c4ef82b30d4cb017508f6857438ca44da41 [12/17] leds: Add support for TI LP5860 LED driver chip
config: x86_64-randconfig-161-20260521 (https://download.01.org/0day-ci/archive/20260521/202605210624.3gcr3prk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605210624.3gcr3prk-lkp@intel.com/

smatch warnings:
drivers/leds/rgb/leds-lp5860-core.c:119 lp5860_iterate_subleds() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +119 drivers/leds/rgb/leds-lp5860-core.c

3daf2c4ef82b30d Steffen Trumtrar 2026-05-05   97  static int lp5860_iterate_subleds(struct lp5860_led *led, struct led_init_data *init_data)
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05   98  {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05   99  	struct fwnode_handle *led_node = NULL;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  100  	struct fwnode_handle *multi_led = init_data->fwnode;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  101  	int subled = 0;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  102  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  103  	fwnode_for_each_child_node(multi_led, led_node) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  104  		u32 channel;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  105  		u32 color_index;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  106  		int ret;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  107  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  108  		ret = fwnode_property_read_u32(led_node, "color", &color_index);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  109  		if (ret) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  110  			dev_err_probe(led->chip->dev, ret,
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  111  				      "%pfwP: Cannot read 'color' property. Skipping.\n", led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  112  			fwnode_handle_put(led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  113  			return ret;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  114  		}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  115  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  116  		ret = fwnode_property_read_u32(led_node, "reg", &channel);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  117  		if (ret < 0 || channel > LP5860_MAX_LED) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  118  			dev_err_probe(led->chip->dev, ret,
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05 @119  				      "%pfwP: 'reg' property is missing. Skipping.\n", led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  120  			fwnode_handle_put(led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  121  			return ret;

Need to set an error code if channel > LP5860_MAX_LED.

3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  122  		}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  123  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  124  		led->mc_cdev.subled_info[subled].color_index = color_index;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  125  		led->mc_cdev.subled_info[subled].channel = channel;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  126  		ret = lp5860_led_init(led, init_data->fwnode, channel);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  127  		if (ret) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  128  			dev_err_probe(led->chip->dev, ret,
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  129  				      "%pfwP: Failed to init LED\n", led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  130  			fwnode_handle_put(led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  131  			return ret;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  132  		}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  133  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  134  		subled++;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  135  	}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  136  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  137  	return 0;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  138  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


