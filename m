Return-Path: <linux-leds+bounces-7470-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Qc6lIzRnw2nlqgQAu9opvQ
	(envelope-from <linux-leds+bounces-7470-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 05:40:20 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C69F231FB65
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 05:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F5013024161
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 04:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B052EDD62;
	Wed, 25 Mar 2026 04:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nex4POUQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F7F30AAA6;
	Wed, 25 Mar 2026 04:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774413617; cv=none; b=l1N0NQ5ADTzxUx0fzH0k9KkmlQC2GVg/4VjMTTvZxDmXTb6VMvqqZ9Y/iJUBgjQd6wswFMklQ2O33J5Lid5nilDxwgcItt+9nlOfugrYCOllcJc70BnJEcLSSN0d9krJ5cB0XTigeX0iBlZFPHozbXz1SpGhPOJ7tXh8Frzy6rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774413617; c=relaxed/simple;
	bh=LmgNB1xmjZImgFB93fYZvPh1g7vCeskBJ9iPGGzmlsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/HAAVFDdHnJ+idq5p3KgDnItY0KSS/fbnDZnQEWTcZ8WBkN0KnHN1iHkWo7kTj92Khv+BSoSIrUxWxmxWa+9QrVtxA9trkklFq9VKsrVwDGnd09APKorMuLka+Bei/V+1t7/igqkofXC7es+BbwlZGi3s3hXwoGhw1CKzer2+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nex4POUQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774413616; x=1805949616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LmgNB1xmjZImgFB93fYZvPh1g7vCeskBJ9iPGGzmlsE=;
  b=nex4POUQStQn/kYzVEJh29ba8ZCaaQ9u/DXsBy5Bt3LzQudk/hNF1D/c
   pZ9rIcYKHqgChUc0RRB++d0YwMOry5POKJlUc3W+g2HMIx8eNo7PU/gim
   gZtWoAhBcXQ8dU/AGB2NuodeTEu6SXIIzLOrDE4aP40edNYBA3Ao0RD61
   xCiUhtJ8qYUOirSbdUkIU3H0Drhh6cc9+qdPftCUDkoUyRBSmIyqLuNc1
   K5Q/olLPV5uQEM5OuFbOZDmGhtpZRq/sJV+IxUADYMLd6miV9SsqmqkJs
   d8LO3erCo37/X1m9TyYCm4QWZOwHHeWOphUBPcBU/aYTZy+aqqtVv3jtx
   g==;
X-CSE-ConnectionGUID: iolkkIssRPKdRcj3dswoBg==
X-CSE-MsgGUID: LGh1hhm6Sme+wlr0xiVFQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79351755"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="79351755"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 21:40:15 -0700
X-CSE-ConnectionGUID: WQf4wyTNRAakbP4ADsMSVw==
X-CSE-MsgGUID: c4Mg+jETRBu1i442LZxmzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="228633804"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Mar 2026 21:40:11 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5G2K-0000000064t-0l4S;
	Wed, 25 Mar 2026 04:40:08 +0000
Date: Wed, 25 Mar 2026 12:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Carlo Szelinsky <github@szelinsky.de>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Carlo Szelinsky <github@szelinsky.de>
Subject: Re: [PATCH v2 3/3] net: pse-pd: add LED trigger support via
 notification path
Message-ID: <202603251250.cuMCk5Yv-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7470-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,git-scm.com:url]
X-Rspamd-Queue-Id: C69F231FB65
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
config: sh-randconfig-002-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251250.cuMCk5Yv-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251250.cuMCk5Yv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251250.cuMCk5Yv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/pse-pd/pse_core.c: In function 'pse_controller_register':
>> drivers/net/pse-pd/pse_core.c:1221:22: error: 'struct pse_controller_dev' has no member named 'pi_led_trigs'
    1221 |                 pcdev->pi_led_trigs = NULL;
         |                      ^~


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

