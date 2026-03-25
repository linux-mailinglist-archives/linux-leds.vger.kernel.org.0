Return-Path: <linux-leds+bounces-7471-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAgEFmlnw2nlqgQAu9opvQ
	(envelope-from <linux-leds+bounces-7471-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 05:41:13 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C663831FB7D
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 05:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A441304FF87
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 04:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4FB30C606;
	Wed, 25 Mar 2026 04:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/DKoFBr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC65030AD0A;
	Wed, 25 Mar 2026 04:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774413619; cv=none; b=ZNQXN/KXaY+qrFgh0q/8v4kGCX6I3IAKOguzYdbhxAqEwZgXSE78p5QqnNYuKSJQC+sQ9qFuODe/8NzwJ4hi1FbFX31pwT1YiZh7eP0q61cACFvWyjqJH35hIek1VuDdku3EY1m1fWrpgLNKp9q7b/Ibw6QTEWFzt+Fd3VZwhg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774413619; c=relaxed/simple;
	bh=FdrSZZJWlda4b/iHdGvUBNw53MhgoxQX4XFQbplHhPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tX+R4J+iAydg33AejYXCcObdpe6O/zhRacSXmfe1fJymOCsATSpIQl1p+3guqyevo+qGF6DlvYyI0hCWnylprUh14GF28s2ma8Qz4eNY1OXzEwGOQy6ZR+AWs16LoK93kI6Wq12Ddlay97owqWu72j6xDKDJzeYtoaxQKICASoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/DKoFBr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774413618; x=1805949618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FdrSZZJWlda4b/iHdGvUBNw53MhgoxQX4XFQbplHhPU=;
  b=i/DKoFBrYGetkPBfnDiM6g6oXtAvrh91GzHTOadmxigPC9WBMQ08RP0l
   Gv1/TtGfaPsR86a/l9tsMsxey9zc8Gc1IK11HE1FuLIxKMTlw0jBz7+PQ
   /m4phX95eL+UTA7r0S0rTo7tW5klSsl1j/K9sFlAnnYJenxNtjTS3Yj/A
   HFhUpmjuEJ/WEAc+cOPPNb6srWdaBjt3c/BMj5ciMt/fABifV9lQR4hnA
   AR49by0iX4Muf6/FpwDBGLC7hH/LWCwGiC/seGDpnVNbOTWTQCbB+e1dn
   XeE/0iDijcbuFChF5eZxatdPyvWCURzx46Y0CRaKNw5HPPNI3ZC8WJj4i
   Q==;
X-CSE-ConnectionGUID: HtK07444Rb+u25vT+J2NBQ==
X-CSE-MsgGUID: +6i3zez1STyyeW8OFfxKMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79351762"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="79351762"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 21:40:15 -0700
X-CSE-ConnectionGUID: ikyhIFZZQWCB7XOgW7Cv+g==
X-CSE-MsgGUID: 7BUuh80bRCCN7c6107pPyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="228633803"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Mar 2026 21:40:11 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5G2K-0000000064r-0e7u;
	Wed, 25 Mar 2026 04:40:08 +0000
Date: Wed, 25 Mar 2026 12:39:30 +0800
From: kernel test robot <lkp@intel.com>
To: Carlo Szelinsky <github@szelinsky.de>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Carlo Szelinsky <github@szelinsky.de>
Subject: Re: [PATCH v2 3/3] net: pse-pd: add LED trigger support via
 notification path
Message-ID: <202603251254.o5PqMBRU-lkp@intel.com>
References: <20260323201225.1836561-4-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323201225.1836561-4-github@szelinsky.de>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7471-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid,git-scm.com:url]
X-Rspamd-Queue-Id: C663831FB7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Carlo,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on net-next/main net/main linus/master v7.0-rc5 next-20260324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Carlo-Szelinsky/dt-bindings-net-pse-pd-add-poll-interval-ms-property/20260325-040935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260323201225.1836561-4-github%40szelinsky.de
patch subject: [PATCH v2 3/3] net: pse-pd: add LED trigger support via notification path
config: hexagon-randconfig-001-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251254.o5PqMBRU-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251254.o5PqMBRU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251254.o5PqMBRU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/pse-pd/pse_core.c:1221:10: error: no member named 'pi_led_trigs' in 'struct pse_controller_dev'
    1221 |                 pcdev->pi_led_trigs = NULL;
         |                 ~~~~~  ^
   1 error generated.


vim +1221 drivers/net/pse-pd/pse_core.c

  1141	
  1142	/**
  1143	 * pse_controller_register - register a PSE controller device
  1144	 * @pcdev: a pointer to the initialized PSE controller device
  1145	 *
  1146	 * Return: 0 on success and failure value on error
  1147	 */
  1148	int pse_controller_register(struct pse_controller_dev *pcdev)
  1149	{
  1150		size_t reg_name_len;
  1151		int ret, i;
  1152	
  1153		mutex_init(&pcdev->lock);
  1154		INIT_LIST_HEAD(&pcdev->pse_control_head);
  1155		spin_lock_init(&pcdev->ntf_fifo_lock);
  1156		ret = kfifo_alloc(&pcdev->ntf_fifo, pcdev->nr_lines, GFP_KERNEL);
  1157		if (ret) {
  1158			dev_err(pcdev->dev, "failed to allocate kfifo notifications\n");
  1159			return ret;
  1160		}
  1161		INIT_WORK(&pcdev->ntf_work, pse_send_ntf_worker);
  1162	
  1163		if (!pcdev->nr_lines)
  1164			pcdev->nr_lines = 1;
  1165	
  1166		if (!pcdev->ops->pi_get_admin_state ||
  1167		    !pcdev->ops->pi_get_pw_status) {
  1168			dev_err(pcdev->dev,
  1169				"Mandatory status report callbacks are missing");
  1170			return -EINVAL;
  1171		}
  1172	
  1173		ret = of_load_pse_pis(pcdev);
  1174		if (ret)
  1175			return ret;
  1176	
  1177		if (pcdev->ops->setup_pi_matrix) {
  1178			ret = pcdev->ops->setup_pi_matrix(pcdev);
  1179			if (ret)
  1180				return ret;
  1181		}
  1182	
  1183		/* Each regulator name len is pcdev dev name + 7 char +
  1184		 * int max digit number (10) + 1
  1185		 */
  1186		reg_name_len = strlen(dev_name(pcdev->dev)) + 18;
  1187	
  1188		/* Register PI regulators */
  1189		for (i = 0; i < pcdev->nr_lines; i++) {
  1190			char *reg_name;
  1191	
  1192			/* Do not register regulator for PIs not described */
  1193			if (!pcdev->no_of_pse_pi && !pcdev->pi[i].np)
  1194				continue;
  1195	
  1196			reg_name = devm_kzalloc(pcdev->dev, reg_name_len, GFP_KERNEL);
  1197			if (!reg_name)
  1198				return -ENOMEM;
  1199	
  1200			snprintf(reg_name, reg_name_len, "pse-%s_pi%d",
  1201				 dev_name(pcdev->dev), i);
  1202	
  1203			ret = devm_pse_pi_regulator_register(pcdev, reg_name, i);
  1204			if (ret)
  1205				return ret;
  1206		}
  1207	
  1208		ret = pse_register_pw_ds(pcdev);
  1209		if (ret)
  1210			return ret;
  1211	
  1212		mutex_lock(&pse_list_mutex);
  1213		list_add(&pcdev->list, &pse_controller_list);
  1214		mutex_unlock(&pse_list_mutex);
  1215	
  1216		ret = pse_led_triggers_register(pcdev);
  1217		if (ret) {
  1218			dev_warn(pcdev->dev, "Failed to register LED triggers: %d\n",
  1219				 ret);
  1220			/* Ensure pse_led_update() is a no-op on partial failure */
> 1221			pcdev->pi_led_trigs = NULL;
  1222		}
  1223	
  1224		return 0;
  1225	}
  1226	EXPORT_SYMBOL_GPL(pse_controller_register);
  1227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

